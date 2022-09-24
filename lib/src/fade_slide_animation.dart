import 'package:flutter/material.dart';

class FadeSlideAnimation extends StatefulWidget {
  const FadeSlideAnimation({
    Key? key,
    this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = const Duration(milliseconds: 0),
    this.startingPosition,
    this.reverse = false,
  }) : super(key: key);

  final Widget? child;
  final Duration duration;
  final Duration delay;
  final Offset? startingPosition;
  final bool reverse;

  @override
  State<FadeSlideAnimation> createState() => _FadeSlideAnimationState();
}

class _FadeSlideAnimationState extends State<FadeSlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset>? _positionAnimation;

  final Curve _fadeCurve = Curves.easeInOutCubic;
  final Curve _positionCurve = Curves.easeOutCubic;

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
    if (widget.startingPosition != null) {
      _positionAnimation = Tween<Offset>(
        begin: widget.startingPosition,
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: _positionCurve,
          reverseCurve: _positionCurve,
        ),
      );
    } else {
      _positionAnimation = null;
    }

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
      child: _positionAnimation != null
          ? SlideTransition(
              position: _positionAnimation!,
              child: widget.child!,
            )
          : widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
