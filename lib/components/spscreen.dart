import 'package:flashchat/screens/dribbbleLoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mesh/mesh.dart';
import 'dart:async';

class SpScreen extends StatefulWidget {
  static const String id = 'pScreen';
  @override
  _SpScreenState createState() => _SpScreenState();
}

class _SpScreenState extends State<SpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    // Make the status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();

    // Navigate to the next screen after the splash
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Dribbbleloginscreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: GridPainter(animationValue: _animation.value),
            child: Container(), // Ensure the grid covers the entire screen
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final dt = _controller.value;
              return OMeshGradient(
                tessellation: 12,
                size: Size.infinite,
                mesh: OMeshRect(
                  width: 3,
                  height: 4,
                  colorSpace: OMeshColorSpace.lab,
                  fallbackColor: Colors.transparent,
                  vertices: [
                    (0.0, 0.3).v.lerpTo((0.0, 0.0).v, dt),
                    (0.5, 0.15).v.lerpTo((0.5, 0.1).v, dt * dt),
                    (1.0, -0.1).v.lerpTo((1.0, 0.3).v, dt * dt), //

                    (-0.05, 0.68).v.lerpTo((0.0, 0.45).v, dt),
                    (0.63, 0.3).v.lerpTo((0.48, 0.54).v, dt),
                    (1.0, 0.1).v.lerpTo((1.0, 0.6).v, dt), //

                    (-0.2, 0.92).v.lerpTo((0.0, 0.58).v, dt),
                    (0.32, 0.72).v.lerpTo((0.58, 0.69).v, dt * dt),
                    (1.0, 0.3).v.lerpTo((1.0, 0.8).v, dt), //

                    (0.0, 1.2).v.lerpTo((0.0, 0.86).v, dt),
                    (0.5, 0.88).v.lerpTo((0.5, 0.95).v, dt),
                    (1.0, 0.82).v.lerpTo((1.0, 1.0).v, dt), //
                  ],
                  colors: [
                    Colors.black
                        .withOpacity(1.0)
                        .lerpTo(Colors.transparent, dt),
                    Colors.black
                        .withOpacity(1.0)
                        .lerpTo(Colors.transparent, dt),
                    Colors.black
                        .withOpacity(1.0)
                        .lerpTo(Colors.transparent, dt), //

                    Colors.black
                        .withOpacity(0.7)
                        .lerpTo(Colors.transparent, dt),
                    Colors.black
                        .withOpacity(0.5)
                        .lerpTo(Colors.transparent, dt),
                    Colors.black
                        .withOpacity(0.7)
                        .lerpTo(Colors.transparent, dt), //

                    Colors.black
                        .withOpacity(0.5)
                        .lerpTo(Colors.transparent, dt),
                    Colors.black
                        .withOpacity(0.4)
                        .lerpTo(Colors.transparent, dt),
                    Colors.black
                        .withOpacity(0.6)
                        .lerpTo(Colors.transparent, dt), //

                    Colors.black
                        .withOpacity(0.3)
                        .lerpTo(Colors.transparent, dt),
                    Colors.black
                        .withOpacity(0.2)
                        .lerpTo(Colors.transparent, dt),
                    Colors.black
                        .withOpacity(0.4)
                        .lerpTo(Colors.transparent, dt), //
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

extension OVertexExtension on OVertex {
  OVertex lerpTo(OVertex b, double t) => OVertex.lerp(this, b, t);
}

extension ColorExtension on Color? {
  Color? lerpTo(Color? b, double t) => Color.lerp(this, b, t);
}

class GridPainter extends CustomPainter {
  final double animationValue;

  GridPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3) // Color of grid lines
      ..strokeWidth = 0.6;

    final gridSize = 12.0;

    // Draw vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Apply the gradient overlay (optional)
    final gradientPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.black.withOpacity(0.8),
          Colors.transparent,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), gradientPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
