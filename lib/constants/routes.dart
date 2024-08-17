import 'package:flutter/material.dart';
import 'package:flashchat/components/splashScreen.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/screens/dribbbleLoginScreen.dart';
import 'package:flashchat/screens/registrationScreen.dart';
import 'package:flashchat/screens/welcome_screen.dart';

var routes = <String, WidgetBuilder>{
  SplashScreen.id: (context) => SplashScreen(),
  Dribbbleloginscreen.id: (context) => Dribbbleloginscreen(),
  Registrationscreen.id: (context) => Registrationscreen(),
  ChatScreen.id: (context) => ChatScreen(),
  WelcomeScreen.id: (context) => WelcomeScreen(),
};
