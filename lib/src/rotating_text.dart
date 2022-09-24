import 'dart:async';

import 'package:flutter/material.dart';

class RotatingText extends StatefulWidget {
  const RotatingText(
    this.texts, {
    Key? key,
    this.style,
  }) : super(key: key);

  final List<String> texts;
  final TextStyle? style;

  @override
  State<RotatingText> createState() => _RotatingTextState();
}

class _RotatingTextState extends State<RotatingText>
    with TickerProviderStateMixin {
  int _index = 0;
  late final Timer _timer;
  Timer? _animationTimer;

  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  final _duration = const Duration(milliseconds: 1000);
  final _switchDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 5), (_) => _nextText());
    _controller = AnimationController(
      duration: _duration,
      reverseDuration: _duration,
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
      reverseCurve: Curves.easeInOutCubic,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
        reverseCurve: Curves.easeInOutCubic,
      ),
    );
    _controller.forward();
    super.initState();
  }

  void _nextText() async {
    _controller.reverse();
    _animationTimer = Timer(_switchDuration, () {
      setState(() => _index = (_index + 1) % widget.texts.length);
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Text(
          widget.texts[_index],
          style: widget.style,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    _animationTimer?.cancel();
    super.dispose();
  }
}
