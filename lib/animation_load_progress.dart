library animation_load_progress;

import 'package:animation_load_progress/curved_progress.dart';
import 'package:flutter/material.dart';

class AnimationLoadProgress extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Color colorProgress;
  final Offset? offset;
  final bool dismissible;
  final Widget child;

  const AnimationLoadProgress({
    super.key,
    required this.inAsyncCall,
    this.opacity = 0.5,
    this.color = Colors.grey,
    this.offset,
    this.dismissible = false,
    required this.child,
    required this.colorProgress,
  });

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) return child;

    Widget layOutProgressIndicator;
    if (offset == null) {
      layOutProgressIndicator = Center(
        child: CurvedCircularProgressIndicator(
          animationDuration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          color: colorProgress,
          strokeWidth: 8,
        ),
      );
    } else {
      layOutProgressIndicator = Positioned(
        left: offset?.dx,
        top: offset?.dy,
        child: Center(
          child: CurvedCircularProgressIndicator(
            animationDuration: const Duration(seconds: 2),
            backgroundColor: Colors.white,
            color: colorProgress,
            strokeWidth: 8,
          ),
        ),
      );
    }

    return Stack(
      children: [
        child,
        Opacity(
          opacity: opacity,
          child: ModalBarrier(dismissible: dismissible, color: color),
        ),
        layOutProgressIndicator,
      ],
    );
  }
}
