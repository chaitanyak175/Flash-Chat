import 'package:flashchat/components/emailTextfield.dart';
import 'package:flashchat/components/myButton.dart';
import 'package:flashchat/components/passwordTextfield.dart';
import 'package:flashchat/constants/setHighRefreshRate.dart';
import 'package:flashchat/screens/registrationScreen.dart';

import 'package:flutter/material.dart';

class Dribbbleloginscreen extends StatefulWidget {
  const Dribbbleloginscreen({super.key});
  static const String id = 'loginScreen';

  @override
  State<Dribbbleloginscreen> createState() => _DribbbleloginscreenState();
}

class _DribbbleloginscreenState extends State<Dribbbleloginscreen>
    with Sethighrefreshrate {
  @override
  void initState() {
    setHighRefreshRate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 15,
              left: 30,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(0, -4),
                    child: Container(
                      height: 25,
                      width: 30,
                      // alignment: Alignment.center,
                      child: ImageIcon(
                        AssetImage('assets/sparkling.png'),
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Flash Chat',
                    style: TextStyle(fontFamily: 'ITCBenguiat', fontSize: 30),
                  )
                ],
              ),
            ),
            Positioned(
              top: 200,
              left: 20,
              right: 20,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'LOGIN INTO YOUR ACCOUNT',
                        style: TextStyle(
                            fontFamily: 'Cirka',
                            fontSize: 38.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Emailtextfield(),
                  SizedBox(
                    height: 25,
                  ),
                  PasswordtextField(),
                  SizedBox(
                    height: 250,
                  ),
                  Mybutton(
                    text: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Registrationscreen.id,
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                            color: Color.fromRGBO(184, 183, 183, 1),
                            fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Registrationscreen.id);
                        },
                        child: Text(
                          'Regsiter',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Gilroy'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
