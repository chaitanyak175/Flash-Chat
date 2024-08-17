import 'package:flutter/material.dart';

class Usernametextfield extends StatefulWidget {
  const Usernametextfield({super.key});

  @override
  State<Usernametextfield> createState() => _UsernametextfieldState();
}

class _UsernametextfieldState extends State<Usernametextfield> {
  final usernameTextController = TextEditingController();

  @override
  void dispose() {
    usernameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: TextField(
        textCapitalization: TextCapitalization.words,
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: usernameTextController,
        autocorrect: false,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          labelText: "Enter your Username",
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
