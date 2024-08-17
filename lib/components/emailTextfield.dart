import 'package:flutter/material.dart';

class Emailtextfield extends StatefulWidget {
  const Emailtextfield({super.key});

  @override
  State<Emailtextfield> createState() => _EmailTextfteldState();
}

class _EmailTextfteldState extends State<Emailtextfield> {
  final emailTextController = TextEditingController();

  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: TextField(
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: emailTextController,
        autocorrect: false,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          labelText: "Enter your email",
          labelStyle: TextStyle(
              color: Color.fromRGBO(97, 96, 97, 1), fontFamily: 'Gilroy'),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: const Color.fromARGB(117, 255, 255, 255),
                strokeAlign: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: const Color.fromARGB(217, 255, 255, 255),
                strokeAlign: 2.0),
          ),
        ),
      ),
    );
  }
}
