import 'package:flutter/material.dart';
import 'authentication/registration.dart';
import 'authentication/login.dart';
import '../components/round_button.dart';

class Welcome extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Student Wellbeing App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 45.0,
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(
              colour: Colors.lightGreen,
              title: 'Log In',
              onPressed: () {
                // -> Go To Log In Screen
                Navigator.pushNamed(context, Login.id);
              },
            ),
            RoundButton(
              colour: Colors.green,
              title: 'Register',
              onPressed: () {
                // -> Go To Registration Screen
                Navigator.pushNamed(context, Registration.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
