import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:logger/components/common/skeleton.dart';
import 'package:logger/components/tracklist/tracklist_stats_tile.dart';
import 'package:logger/data/models/tracklist_item.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/log_filters_provider.dart';
import 'package:logger/providers/screen_index.dart';
import 'package:logger/providers/tracklist_provider.dart';
import 'package:logger/screens/tracklist/fragments/weekday_barchart.dart';
import 'package:logger/utils/call_display_helper.dart';
import 'package:logger/utils/contact_handler.dart';
import 'package:logger/utils/format_helpers.dart';
import 'package:logger/utils/native_methods.dart';
import 'package:logger/utils/phone_formatter.dart';
import 'package:logger/utils/tracking_metrics.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class TracklistItemUi extends ConsumerStatefulWidget {
  final TrackListItem item;
  const TracklistItemUi({super.key, required this.item});

  @override
  ConsumerState<TracklistItemUi> createState() => _TracklistItemUiState();
}

class _TracklistItemUiState extends ConsumerState<TracklistItemUi> {
  Future<TrackingMetrics> getMetrics(String phoneNumber) async {
    var entries = ref.watch(callLogsNotifierProvider).value ?? [];
    var mappedEntries = entries.where(
        (e) => PhoneFormatter.parsePhoneNumber(e.number ?? "") == phoneNumber);
    return parseTrackingMetrics(mappedEntries);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMetrics(widget.item.phoneNumber),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == null) return const SizedBox();

          return Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).canvasColor.withAlpha(150),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Slidable(
                startActionPane: ActionPane(
                    extentRatio: 0.3,
                    motion: const StretchMotion(),
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          outlinedButtonTheme: OutlinedButtonThemeData(
                            style: ButtonStyle(
                              iconColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? WidgetStatePropertyAll(
                                      Color.fromARGB(255, 235, 235, 235))
                                  : WidgetStatePropertyAll(Colors.white),
                            ),
                          ),
                        ),
                        child: SlidableAction(
                          autoClose: true,
                          flex: 1,
                          onPressed: (context) async {
                            var uri =
                                Uri.parse("tel:${widget.item.phoneNumber}");
                            await launchUrl(uri);
                          },
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? const Color.fromARGB(255, 60, 60, 60)
                                  : Colors.black,
                          icon: Icons.call,
                          label: AppLocalizations.of(context).callText,
                        ),
                      ),
                    ]),
                endActionPane: ActionPane(
                  extentRatio: 0.3,
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      autoClose: true,
                      flex: 1,
                      onPressed: (context) async {
                        await ref
                            .read(trackListProvider.notifier)
                            .removeNumberById(widget.item.id);
                      },
                      backgroundColor: Colors.redAccent,
                      icon: Icons.delete,
                      label: AppLocalizations.of(context).removeText,
                    ),
                  ],
                ),
                child: GestureDetector(
                  onLongPress: () async {
                    bool isUnknown = CallDisplayHelper.isUnknownContact(
                      snapshot.data!.lastCallEntry!,
                    );
                    await HapticFeedback.vibrate();

                    if (context.mounted) {
                      isUnknown
                          ? ContactHandler.handleAddToContacts(
                              context, snapshot.data!.lastCallEntry!.number)
                          : ContactHandler.handleOpenContact(
                              context, snapshot.data!.lastCallEntry!.number);
                    }
                  },
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      child: snapshot.data!.lastCallEntry?.photoUri != null
                          ? FutureBuilder(
                              future: NativeMethods.getContactPhotoFromUri(
                                  snapshot.data!.lastCallEntry?.photoUri),
                              builder: (context, childSnapshot) {
                                if (childSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircleAvatar(
                                    child: Icon(Icons.person),
                                  );
                                }

                                if (!childSnapshot.hasData ||
                                    childSnapshot.data == null) {
                                  return const CircleAvatar(
                                    child: Icon(Icons.person),
                                  );
                                }

                                return CircleAvatar(
                                  backgroundImage:
                                      MemoryImage(childSnapshot.data!),
                                );
                              },
                            )
                          : Text(
                              (snapshot.data!.lastCallEntry?.name ?? "?")[0],
                              style: const TextStyle(fontSize: 25),
                            ),
                    ),
                    title: Text(
                      snapshot.data!.lastCallEntry?.name ??
                          AppLocalizations.of(context).unknownText,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    subtitle: Text(
                      widget.item.phoneNumber,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 12.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  var uri = Uri.parse(
                                      "sms:${widget.item.phoneNumber}");
                                  await launchUrl(uri);
                                },
                                icon: Icon(Icons.sms),
                                label: Text(
                                  AppLocalizations.of(context).smsText,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  ref
                                      .read(screenIndexProvider.notifier)
                                      .setIndex(0);
                                  await ref
                                      .read(logsFilterProvider.notifier)
                                      .filterByPhoneNumber(
                                        widget.item.phoneNumber,
                                      );
                                },
                                icon: Icon(Icons.electric_bolt),
                                label: Text(AppLocalizations.of(context)
                                    .quickFilterText),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.0,
                                vertical: 10.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .iteractionScoreText,
                                        style: TextStyle(
                                          fontSize:
                                              16, // adjust for dark background
                                        ),
                                      ),
                                      Text(
                                        "${snapshot.data!.relationshipStrength.toStringAsFixed(0)}%",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  LinearProgressIndicator(
                                    borderRadius: BorderRadius.circular(20.0),
                                    value: snapshot.data!.relationshipStrength /
                                        100,
                                    backgroundColor: Colors.grey[800],
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    minHeight: 10,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TracklistStatsTile(
                              labels: [
                                AppLocalizations.of(context).lastCallSinceText,
                                AppLocalizations.of(context).avgCallsMonthText,
                                AppLocalizations.of(context)
                                    .avgCallDurationText,
                                AppLocalizations.of(context)
                                    .peakCallDurationText,
                                AppLocalizations.of(context).callsPerWeekText
                              ],
                              values: [
                                snapshot.data!.lastCallSince(context),
                                FromatHelpers.prettifyNumbers(
                                  snapshot.data!.averageCallsPerMonth.round(),
                                  context,
                                ),
                                FromatHelpers.prettifyDuration(
                                  Duration(
                                    seconds: snapshot
                                        .data!.averageCallDurationSeconds
                                        .round(),
                                  ),
                                  context,
                                ),
                                FromatHelpers.prettifyDuration(
                                  Duration(
                                    seconds: snapshot.data!.longestCallSeconds
                                        .round(),
                                  ),
                                  context,
                                ),
                                FromatHelpers.prettifyNumbers(
                                  snapshot.data!.callsPerWeek.round(),
                                  context,
                                ),
                              ],
                              icons: [
                                Icon(
                                  Icons.history,
                                  color: Colors.amberAccent,
                                ),
                                Icon(
                                  Icons.date_range,
                                  color: Colors.orangeAccent,
                                ),
                                Icon(
                                  Icons.access_time,
                                  color: Colors.blueAccent,
                                ),
                                Icon(
                                  Icons.trending_up,
                                  color: Colors.greenAccent,
                                ),
                                Icon(
                                  Icons.view_week,
                                  color: Colors.purpleAccent,
                                ),
                              ],
                              showTitle: false,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 20.0,
                                left: 5.0,
                                right: 5.0,
                              ),
                              child: Text(
                                AppLocalizations.of(context).callDistByWeekDay,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: WeekdayBarChart(
                                weekdayPercentages:
                                    snapshot.data!.weekdayPercentages,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          var n = (ref.watch(trackListProvider).value ?? []).length;

          return Column(
            children: List.generate(n, (index) {
              final skeleton = Skeleton(
                useTitle: false,
                height: 70.0,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(255, 64, 58, 72)
                    : const Color.fromARGB(255, 240, 230, 255),
              );

              return Column(
                children: [
                  skeleton,
                  if (index != n - 1) const SizedBox(height: 10.0),
                ],
              );
            }),
          );
        }
      },
    );
  }
}
