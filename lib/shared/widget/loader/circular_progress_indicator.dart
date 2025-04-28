import 'dart:math';

import 'package:chatapp/constant/constant.dart';
import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatefulWidget {
  final double? radius;
  final double? strokeWidth;

  const GradientCircularProgressIndicator({
    super.key,
    this.radius,
    this.strokeWidth = 4,
  });

  @override
  _GradientCircularProgressIndicatorState createState() =>
      _GradientCircularProgressIndicatorState();
}

class _GradientCircularProgressIndicatorState
    extends State<GradientCircularProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
        child: CustomPaint(
          size: Size.fromRadius(widget.radius ?? 20),
          painter: GradientCircularProgressPainter(
            radius: widget.radius ?? 20,
            gradientColors: [
              Colors.transparent,
              constant.primary,
              constant.primary,
            ],
            strokeWidth: widget.strokeWidth ?? 2,
          ),
        ),
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader =
        SweepGradient(colors: gradientColors, startAngle: 0.0, endAngle: 2 * pi)
            .createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
