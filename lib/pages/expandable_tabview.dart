import 'package:flutter/material.dart';

class ExpandableTabView extends StatefulWidget {
  ExpandableTabView(
      {Key? key,
      @required this.children,
      @required this.tabSize,
      @required this.tabController})
      : super(key: key);
  final List<Widget>? children;
  final int? tabSize;
  final TabController? tabController;
  @override
  State<StatefulWidget> createState() {
    return _ExpandableTabViewState();
  }
}

class _ExpandableTabViewState extends State<ExpandableTabView> {
  List<double>? _heights;
  int _currentTab = 0;
  double get _currentHeight => _heights![_currentTab];
  @override
  void initState() {
    super.initState();
    _heights = widget.children!.map((e) => 0.0).toList();
    widget.tabController!
      ..addListener(() {
        final _newTab = widget.tabController!.index.round();
        if (_currentTab != _newTab) {
          setState(() {
            _currentTab = _newTab;
          });
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: _heights![0], end: _currentHeight),
      duration: const Duration(milliseconds: 100),
      builder: (context, double value, child) {
        return SizedBox(height: value, child: child);
      },
      child: TabBarView(
        controller: widget.tabController,
        children: _sizeReportingChildren
            .map((int index, Widget child) => MapEntry(index, child))
            .values
            .toList(),
      ),
    );
  }

  Map<int, OverflowBox> get _sizeReportingChildren =>
      widget.children!.asMap().map((index, child) => MapEntry(
          index,
          OverflowBox(
              minHeight: 0,
              maxHeight: double.infinity,
              alignment: Alignment.topCenter,
              child: SizeReportingWidget(
                onSizeChange: (size) => setState(() {
                  _heights![index] = size.height;
                }),
                child: Align(child: child),
              ))));
}

class SizeReportingWidget extends StatefulWidget {
  final Widget? child;
  final ValueChanged<Size>? onSizeChange;
  const SizeReportingWidget({
    Key? key,
    @required this.child,
    @required this.onSizeChange,
  }) : super(key: key);
  @override
  _SizeReportingWidgetState createState() {
    return _SizeReportingWidgetState();
  }
}

class _SizeReportingWidgetState extends State<SizeReportingWidget> {
  Size? _oldSize;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    return widget.child!;
  }

  void _notifySize() {
    if (!this.mounted) {
      return;
    }
    final size = context.size;
    if (_oldSize != size) {
      _oldSize = size;
      Size increasedSize = Size(size!.width, size.height + 1000.0);
      widget.onSizeChange!(increasedSize);
    }
  }
}
