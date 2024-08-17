import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordtextField extends StatefulWidget {
  const PasswordtextField({super.key});

  @override
  State<PasswordtextField> createState() => _PasswordtextFieldState();
}

class _PasswordtextFieldState extends State<PasswordtextField> {
  final passwordTextController = TextEditingController();
  bool _obscureText = true;
  bool showPasswordIcon = false;

  void toggleShowPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  ImageIcon toggleShowPasswordIcon() {
    if (showPasswordIcon == false) {
      return ImageIcon(
        AssetImage('assets/eyeIconOpen.png'),
      );
    } else {
      return ImageIcon(
        AssetImage('assets/eyeIconClosed.png'),
      );
    }
  }

  @override
  void dispose() {
    passwordTextController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    final text = passwordTextController.text;
    print('Password is: $text (${text.characters.length})');
  }

  IconButton showPasswordIconButton() {
    final text = passwordTextController.text;
    if (text.characters.length < 1) {
      return IconButton(onPressed: () {}, icon: Icon(null));
    } else {
      return IconButton(
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        style: ButtonStyle(splashFactory: NoSplash.splashFactory),
        enableFeedback: true,
        onPressed: () {
          setState(() {
            showPasswordIcon = !showPasswordIcon;
            toggleShowPassword();
            _printLatestValue();
          });
          HapticFeedback.heavyImpact();
        },
        icon: toggleShowPasswordIcon(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: TextFormField(
        onChanged: (value) {
          _printLatestValue();
          setState(() {
            showPasswordIconButton();
          });
        },
        controller: passwordTextController,
        obscureText: _obscureText,
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        autocorrect: false,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon: showPasswordIconButton(),
          labelText: "Password",
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
                color: const Color.fromARGB(226, 255, 255, 255),
                strokeAlign: 2.0),
          ),
        ),
      ),
    );
  }
}
