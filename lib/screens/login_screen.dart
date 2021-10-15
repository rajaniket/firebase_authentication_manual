//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'homepage.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  // https://flutter.dev/docs/cookbook/forms/validation
  final _formKey = GlobalKey<FormState>();
  //final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                onSaved: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter your Email";
                  } else if (RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please Enter a valid email");
                  } else
                    return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 3)),
                  //  border: InputBorder.
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                validator: (value) {
                  RegExp regex = new RegExp(r'^.{6,}$');
                  if (value.isEmpty) {
                    return ("Please Enter Your Password");
                  } else if (!regex.hasMatch(value)) {
                    return ("Please Enter valid Password (Min. 6 Character");
                  } else
                    return null;
                },
                onSaved: (value) {
                  password = value;
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.vpn_key_sharp,
                    color: Colors.grey[600],
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red, width: 3.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green, width: 3)),
                  //  border: InputBorder.
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[800],
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(340, 52),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // How does this work

  /*
To validate the form, use the _formKey created in step 1. You can use the _formKey.currentState() method to access the FormState, which is automatically created by Flutter when building a Form.
The FormState class contains the validate() method. When the validate() method is called, it runs the validator() function for each text field in the form. If everything looks good, the validate() method returns true. If any text field contains errors, the validate() method rebuilds the form to display any error messages and returns false.
 */

  void signIn(String email, String password) async {
    if (_formKey.currentState.validate()) {
      await _auth
          .signInWithEmailAndPassword(
              email: email,
              password: password) // passing email and password of user
          .then((UserId) => {
                // if successful
                Fluttertoast.showToast(
                    msg:
                        "Login Successful"), // fluttertoast library is added it will show error while authenticating
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);  // this will show errors like , user has not registered yet
      });
    }
  }
}
