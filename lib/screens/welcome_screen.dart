import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image.asset('images/healthy.png'),
              height: 100.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'ReLife',
                style: TextStyle(
                    color: Colors.pink[900],
                    fontWeight: FontWeight.w800,
                    fontSize: 45),
              ),
            ),
            SizedBox(height: 48.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/login_screen");
                },
                child: Text('Log In'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[600],
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(200, 50),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/registration_screen");
                },
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[800],
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(200, 50),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
