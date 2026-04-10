import 'package:flutter/material.dart';

class SlideFromRight extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const SlideFromRight({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<SlideFromRight> createState() => _SlideFromRightState();
}

class _SlideFromRightState extends State<SlideFromRight>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _slide = Tween<Offset>(
      begin: const Offset(1, 0), // 👉 from right
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _slide, child: widget.child);
  }
}
