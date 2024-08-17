import 'package:flashchat/constants/setHighRefreshRate.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flashchat/screens/dribbbleLoginScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin, Sethighrefreshrate {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    setHighRefreshRate();
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

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    // Navigate to the next screen after the splash
    Timer(Duration(seconds: 3), () {
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
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final double animationValue;

  GridPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 0.6;

    // Top-left gradient
    final topGradientPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.black.withOpacity(0.0), // Fully transparent at the top
          Color.fromRGBO(150, 150, 150,
              0.2), // Slightly brighter grey color with more transparency
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 0.6;

    // Bottom-right gradient with less intensity
    final bottomGradientPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent, // Start with transparent
          Color.fromRGBO(150, 150, 150, 0.1), // Less intense grey color
          Colors.transparent, // Fade to transparent
        ],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        stops: [0.0, animationValue, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 0.6;

    final gridSize = 12.0;

    // Draw grid lines with the top-left gradient
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), topGradientPaint);
      canvas.drawLine(
          Offset(x, 0), Offset(x, size.height), bottomGradientPaint);
    }

    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), topGradientPaint);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), bottomGradientPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
