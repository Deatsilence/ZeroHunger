import 'package:flutter/material.dart';

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final int height;
  final bool expand;

  const ExpandedSection({
    super.key,
    this.expand = false,
    required this.child,
    required this.height,
  });

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection> with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: animation,
        child: Container(
          padding: const EdgeInsets.only(bottom: 5),
          constraints: BoxConstraints(
              //minHeight: 100,
              minWidth: double.infinity,
              maxHeight: widget.height > 5
                  ? 195
                  : widget.height == 1
                      ? 55
                      : widget.height * 50.0),
          child: Padding(padding: const EdgeInsets.only(bottom: 5), child: widget.child),
        ));
  }
}
