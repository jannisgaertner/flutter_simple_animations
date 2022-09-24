import 'dart:async';

import 'package:flutter/material.dart';

class BounceDownAnimation extends StatefulWidget {
  const BounceDownAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<BounceDownAnimation> createState() => _BounceDownAnimationState();
}

class _BounceDownAnimationState extends State<BounceDownAnimation>
    with TickerProviderStateMixin {
  late final Timer _timer;
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;

  final _duration = const Duration(milliseconds: 950);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_controller.value == 1) {
        _controller.reverse();
      } else if (timer.tick % 3 == 0) {
        _controller.forward();
      }
    });

    _controller = AnimationController(
      duration: _duration,
      reverseDuration: _duration,
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 1.2),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic,
        reverseCurve: Curves.easeInCubic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _slideAnimation, child: widget.child);
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }
}
