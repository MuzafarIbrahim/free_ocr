import 'package:flutter/material.dart';

class SplashAnimationController {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;
  late final Animation<double> _opacityAnimation;

  Animation<Offset> get animation => _animation;
  Animation<double> get opacityAnimation => _opacityAnimation;

  SplashAnimationController(TickerProvider vsync) {
    _controller = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  void dispose() {
    _controller.dispose();
  }
}
