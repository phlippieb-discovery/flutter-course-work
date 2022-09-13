import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/my_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: kZapLogoHeroTag,
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kInputDecoration.copyWith(hintText: 'Email'),
              style: kInputTextStyle,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kInputDecoration.copyWith(hintText: 'Password'),
              style: kInputTextStyle,
            ),
            SizedBox(
              height: 24.0,
            ),
            MyButton(
              text: 'Log In Yo',
              color: Colors.lightBlueAccent,
              onPressed: () {
                // TODO
              },
            ),
          ],
        ),
      ),
    );
  }
}
