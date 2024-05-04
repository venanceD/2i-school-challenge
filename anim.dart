import 'package:flutter/material.dart';
import 'dart:async';

class anim extends StatefulWidget {
  final Widget child;
  final int delay;

  const anim({required this.delay, required this.child});

  @override
  State<anim> createState() => _animState();
}

class _animState extends State<anim> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationOffset;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    final curve =
        CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _animationOffset = Tween<Offset>(
      begin: Offset(0.0, -0.5),
      end: Offset.zero,
    ).animate(curve);
    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animationOffset,
        child: widget.child,
      ),
    );
  }
}
