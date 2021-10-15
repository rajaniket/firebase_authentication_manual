import 'package:firebase1/screens/login_screen.dart';
import 'package:firebase1/screens/registration_screen.dart';
import 'package:firebase1/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: 'welcome_screen', // if you use intial_route then you cannot use home
      home: WelcomeScreen(),
      routes: {
        '/welcome_screen': (context) =>
            WelcomeScreen(), // route is a map of key_value pair of string, anonymous function which takes current context and returns welcome screen
        '/login_screen': (context) => LogIn(),
        '/registration_screen': (context) => RegisterScreen(),
        // 'chat_screen' : (context) => ChatScreen(),
      },
    );
  }
}
