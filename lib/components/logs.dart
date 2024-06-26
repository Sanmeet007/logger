import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logger/components/logs_builder.dart';
import 'package:logger/utils/utils.dart';

class LogsPage extends StatefulWidget {
  final Iterable<CallLogEntry>? entries;
  const LogsPage({super.key, this.entries});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = true;

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
      var logs = groupCallLogsByDate(widget.entries!);
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _isVisible ? 1.0 : 0.0,
          child: _isVisible
              ? FloatingActionButton.small(
                  shape: const CircleBorder(),
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
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(mapEntry.key),
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.black45
                          : const Color.fromARGB(255, 249, 245, 255),
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
      child: const Center(child: Text("Nothing to display")),
    );
  }
}
