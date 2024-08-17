import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 480,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
        style: ButtonStyle(
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            overlayColor: WidgetStatePropertyAll(Colors.transparent)),
        // padding: WidgetStatePropertyAll(EdgeInsets.all(25)),
      ),
    );
  }
}
