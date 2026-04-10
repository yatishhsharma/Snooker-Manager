import 'package:flutter/material.dart';

class FadeThenSlide extends StatefulWidget {
  final Widget child;

  final Duration duration;

  // Control timing (0.0 → 1.0)
  final double fadeStart;
  final double fadeEnd;

  final double slideStart;
  final double slideEnd;

  const FadeThenSlide({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.fadeStart = 0.0,
    this.fadeEnd = 0.5,
    this.slideStart = 0.5,
    this.slideEnd = 1.0,
  });

  @override
  State<FadeThenSlide> createState() => _FadeThenSlideState();
}

class _FadeThenSlideState extends State<FadeThenSlide>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(widget.fadeStart, widget.fadeEnd, curve: Curves.easeIn),
      ),
    );

    _slide =
        Tween<Offset>(
          begin: const Offset(0.0, 1.0), // smoother than 10.0
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              widget.slideStart,
              widget.slideEnd,
              curve: Curves.easeOut,
            ),
          ),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slide,
      child: FadeTransition(opacity: _fade, child: widget.child),
    );
  }
}
