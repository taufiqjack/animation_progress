library animation_load_progress;

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AnimationLoadProgress extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final bool dismissible;
  final Widget child;
  final double height;
  final double width;
  final List<Color> colorList;

  const AnimationLoadProgress({
    Key? key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.dismissible = false,
    required this.child,
    required this.height,
    required this.width,
    required this.colorList,
  })  : assert(child != null),
        assert(inAsyncCall != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) return child;
    Widget layOutProgressIndicator;
    layOutProgressIndicator = Center(
      child: SizedBox(
        height: height,
        width: width,
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: colorList,
          strokeWidth: 2,
        ),
      ),
    );
    return Stack(
      children: [
        child,
        Opacity(
          child: ModalBarrier(dismissible: dismissible, color: color),
          opacity: opacity,
        ),
        layOutProgressIndicator,
      ],
    );
  }
}
