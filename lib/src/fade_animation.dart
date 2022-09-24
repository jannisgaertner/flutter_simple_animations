import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  const FadeAnimation({
    Key? key,
    this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = const Duration(milliseconds: 0),
    this.reverse = false,
  }) : super(key: key);

  final Widget? child;
  final Duration duration;
  final Duration delay;
  final bool reverse;

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final Curve _fadeCurve = Curves.easeInOutCubic;

  @override
  void initState() {
    super.initState();
    _init();
    _animate();
  }

  void _init() {
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.duration,
      vsync: this,
    );
    if (widget.reverse) {
      _controller.value = 1;
    }

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: _fadeCurve,
      reverseCurve: _fadeCurve,
    );

    _controller.addListener(() => setState(() {}));
  }

  Future<void> _animate() async {
    await Future<void>.delayed(widget.delay);

    if (widget.reverse) {
      _controller.animateTo(0);
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
