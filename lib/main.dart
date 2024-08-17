import 'package:flutter/material.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flutter/services.dart';
import 'package:flashchat/constants/routes.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.black,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.grey,
          selectionHandleColor: Colors.white,
          cursorColor: Colors.white,
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: routes,
    );
  }
}
