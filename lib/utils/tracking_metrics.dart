import 'dart:math' as math;
import 'dart:core';
import 'package:call_log/call_log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;

TrackingMetrics _parseTrackingMetrics(Iterable<CallLogEntry> entries) {
  return TrackingMetrics.fromEntries(entries);
}

Future<TrackingMetrics> parseTrackingMetrics(
    Iterable<CallLogEntry> entries) async {
  return await compute(_parseTrackingMetrics, entries);
}

class TrackingMetrics {
  static const maxExpectedInteractionScore = 50;
  static const double maxExpectedDurationHours = 10;

  final CallLogEntry? lastCallEntry;
  final int daysSinceLastCall;

  final double averageCallsPerMonth;
  final double callsPerWeek;
  final double averageCallDurationSeconds;
  final int longestCallSeconds;
  final int totalCalls;
  final int totalDurationSeconds;
  final double relationshipStrength;
  final List<double> weekdayPercentages;

  TrackingMetrics._({
    required this.lastCallEntry,
    required this.daysSinceLastCall,
    required this.averageCallsPerMonth,
    required this.callsPerWeek,
    required this.averageCallDurationSeconds,
    required this.longestCallSeconds,
    required this.totalCalls,
    required this.totalDurationSeconds,
    required this.relationshipStrength,
    required this.weekdayPercentages,
  });

  factory TrackingMetrics.fromEntries(
    Iterable<CallLogEntry> entries, {
    double minStrengthFloor = 20.0,
  }) {
    if (entries.isEmpty) {
      return TrackingMetrics._(
        lastCallEntry: null,
        daysSinceLastCall: -1,
        averageCallsPerMonth: 0.0,
        callsPerWeek: 0.0,
        averageCallDurationSeconds: 0.0,
        longestCallSeconds: 0,
        totalCalls: 0,
        totalDurationSeconds: 0,
        relationshipStrength: minStrengthFloor.clamp(0, 100).toDouble(),
        weekdayPercentages: List.filled(7, 0.0),
      );
    }

    int incoming = 0, outgoing = 0, missed = 0, rejected = 0;
    int totalCalls = 0;
    int totalDurationSeconds = 0;
    int longestCallSeconds = 0;

    int? minTs;
    int? maxTs;
    CallLogEntry? lastCallEntry;

    final Map<int, int> weekdayCounts = {for (var i = 0; i < 7; i++) i: 0};

    // Maps for calendar grouping
    final Map<String, int> callsPerYearMonth = {};
    final Map<String, int> callsPerYearWeek = {};

    for (final e in entries) {
      final callType = e.callType;
      final secs = e.duration ?? 0;
      final int? ts = e.timestamp;

      switch (callType) {
        case CallType.incoming:
        case CallType.wifiIncoming:
          incoming++;
          break;
        case CallType.outgoing:
        case CallType.wifiOutgoing:
          outgoing++;
          break;
        case CallType.missed:
          missed++;
          break;
        case CallType.rejected:
          rejected++;
          break;
        default:
      }

      totalCalls++;
      totalDurationSeconds += secs;

      if (secs > longestCallSeconds) longestCallSeconds = secs;

      // Only use valid timestamps for min/max/last/weekday/month/week grouping
      if (ts != null && ts > 0) {
        if (minTs == null || ts < minTs) minTs = ts;
        if (maxTs == null || ts > maxTs) {
          maxTs = ts;
          lastCallEntry = e;
        }

        final dt = DateTime.fromMillisecondsSinceEpoch(ts);

        // Weekday counts (0 = Sunday)
        final weekday = dt.weekday % 7;
        weekdayCounts[weekday] = (weekdayCounts[weekday] ?? 0) + 1;

        // --- Year-Month key ---
        final ymKey = '${dt.year}-${dt.month.toString().padLeft(2, '0')}';
        callsPerYearMonth[ymKey] = (callsPerYearMonth[ymKey] ?? 0) + 1;

        // --- Year-Week key (ISO-like) ---
        final weekNumber =
            ((dt.difference(DateTime(dt.year, 1, 1)).inDays) ~/ 7) + 1;
        final ywKey = '${dt.year}-W${weekNumber.toString().padLeft(2, '0')}';
        callsPerYearWeek[ywKey] = (callsPerYearWeek[ywKey] ?? 0) + 1;
      }
    }

    // --- Average calls per month ---
    double averageCallsPerMonth = 0.0;
    if (callsPerYearMonth.isNotEmpty) {
      final int totalTimestampedCalls =
          callsPerYearMonth.values.fold(0, (s, v) => s + v);

      final DateTime firstDt = DateTime.fromMillisecondsSinceEpoch(minTs!);
      final DateTime lastDt = DateTime.fromMillisecondsSinceEpoch(maxTs!);
      final int monthsBetween = math.max(
          1,
          (lastDt.year - firstDt.year) * 12 +
              (lastDt.month - firstDt.month) +
              1); // inclusive months
      averageCallsPerMonth = totalTimestampedCalls / monthsBetween;
    }

    // --- Average calls per week ---
    double callsPerWeek = 0.0;
    if (callsPerYearWeek.isNotEmpty) {
      final int totalTimestampedCalls =
          callsPerYearWeek.values.fold(0, (s, v) => s + v);
      callsPerWeek = totalTimestampedCalls / callsPerYearWeek.length;
    }

    // --- Average call duration ---
    final double averageCallDurationSeconds =
        totalCalls > 0 ? (totalDurationSeconds / totalCalls) : 0.0;

    // --- Last call & days since last call ---
    final DateTime? lastCall = lastCallEntry?.timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(lastCallEntry!.timestamp!)
        : null;

    final int daysSinceLastCall =
        lastCall != null ? DateTime.now().difference(lastCall).inDays : -1;

    // --- Relationship strength ---
    final double interactionScore =
        incoming + outgoing - 0.5 * missed - 0.3 * rejected;
    final double durationHours = totalDurationSeconds / 3600.0;
    final double recencyFactor =
        daysSinceLastCall >= 0 ? math.exp(-daysSinceLastCall / 30.0) : 0.5;

    final double interactionComponent =
        (interactionScore / maxExpectedInteractionScore) * 50;
    final double durationComponent =
        (durationHours / maxExpectedDurationHours) * 50;
    final double rawScore =
        (interactionComponent + durationComponent) * recencyFactor;

    final double strength = rawScore.isFinite
        ? rawScore.clamp(minStrengthFloor, 100).toDouble()
        : minStrengthFloor;

    // --- Weekday averages ---
    final List<double> weekdayAverages = List.generate(
        7, (i) => weekdayCounts[i]! / math.max(1, callsPerYearWeek.length));
    final total = weekdayAverages.reduce((a, b) => a + b);
    final List<double> weekdayPercentages = weekdayAverages
        .map((v) => total == 0 ? 0.0 : (v / total) * 100)
        .toList();

    return TrackingMetrics._(
      lastCallEntry: lastCallEntry,
      daysSinceLastCall: daysSinceLastCall,
      averageCallsPerMonth: averageCallsPerMonth,
      callsPerWeek: callsPerWeek,
      averageCallDurationSeconds: averageCallDurationSeconds,
      longestCallSeconds: longestCallSeconds,
      totalCalls: totalCalls,
      totalDurationSeconds: totalDurationSeconds,
      relationshipStrength: strength,
      weekdayPercentages: weekdayPercentages,
    );
  }

  String lastCallSince(BuildContext context) {
    if (lastCallEntry?.timestamp == null) {
      return AppLocalizations.of(context).naText;
    }

    return timeago.format(
      DateTime.fromMillisecondsSinceEpoch(
        lastCallEntry?.timestamp ?? 0,
      ),
      locale: AppLocalizations.of(context).localeName,
    );
  }

  /// ONLY FOR DEBUGGING
  @override
  String toString() {
    final weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final weekdayStr = List.generate(
      7,
      (i) => '${weekdays[i]}: ${weekdayPercentages[i].toStringAsFixed(1)}',
    ).join(', ');

    return 'TrackingMetrics('
        'latestCall: $lastCallEntry, '
        'type: ${lastCallEntry?.callType}, '
        'daysSinceLast: $daysSinceLastCall, '
        'avgCalls/month: ${averageCallsPerMonth.toStringAsFixed(1)}, '
        'avgDuration: ${averageCallDurationSeconds.toStringAsFixed(1)}s, '
        'longest: ${longestCallSeconds}s, '
        'calls/week: ${callsPerWeek.toStringAsFixed(1)}, '
        'strength: ${relationshipStrength.toStringAsFixed(1)}, '
        'weekdayPercentages: [$weekdayStr]'
        ')';
  }
}
