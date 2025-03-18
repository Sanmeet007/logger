import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logger/components/logs/grouped_logs_builder.dart';
import 'package:logger/components/logs/quick_summary.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/utils/call_log_grouper.dart';
import 'package:logger/utils/format_helpers.dart';

class LogsPage extends StatefulWidget {
  final Iterable<CallLogEntry>? entries;
  final bool callLogCountVisibility;
  const LogsPage({
    super.key,
    this.entries,
    required this.callLogCountVisibility,
  });

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse ||
        _scrollController.position.pixels == 0) {
      if (_isVisible) {
        setState(() {
          _isVisible = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
        });
      }
    }
  }

  void scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.entries != null && widget.entries!.isNotEmpty) {
      var logs = CallLogGrouper.groupCallLogsByDate(widget.entries!, context);
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: _isVisible ? 1.0 : 0.0,
          child: _isVisible
              ? FloatingActionButton.small(
                  shape: const CircleBorder(),
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 203, 169, 255),
                  enableFeedback: true,
                  onPressed: scrollToTop,
                  child: const Icon(
                    Icons.keyboard_arrow_up_rounded,
                    size: 40.0,
                  ),
                )
              : Container(),
        ),
        body: RawScrollbar(
          controller: _scrollController,
          crossAxisMargin: 10.0,
          mainAxisMargin: 10.0,
          thickness: 10.0,
          minThumbLength: 50.0,
          radius: const Radius.circular(10.0),
          interactive: true,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: logs.entries.length,
            itemBuilder: (context, index) {
              final mapEntry = logs.entries.elementAt(index);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return QuickLogSummary(
                            logs: mapEntry.value,
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(mapEntry.key),
                          if (widget.callLogCountVisibility)
                            Text(
                              FromatHelpers.prettifyNumbers(
                                  mapEntry.value.length, context),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Material(
                      child: GroupedLogsBuilder(
                        entries: mapEntry.value,
                        formattedDate: mapEntry.key,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: Text(
        AppLocalizations.of(context).nothingToDisplayText,
      )),
    );
  }
}
