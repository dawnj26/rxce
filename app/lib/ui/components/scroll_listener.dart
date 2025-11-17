import 'package:flutter/material.dart';

class ScrollListener extends StatefulWidget {
  const ScrollListener({
    required this.slivers,
    super.key,
    this.onScrollEnd,
    this.threshold = 0.9,
    this.physics,
  });

  final void Function()? onScrollEnd;
  final List<Widget> slivers;
  final double threshold;
  final ScrollPhysics? physics;

  @override
  State<ScrollListener> createState() => _ScrollListenerState();
}

class _ScrollListenerState extends State<ScrollListener> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.onScrollEnd != null) {
      _scrollController.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: widget.slivers,
      physics: widget.physics,
    );
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * widget.threshold);
  }

  void _onScroll() {
    if (_isBottom) {
      widget.onScrollEnd?.call();
    }
  }
}
