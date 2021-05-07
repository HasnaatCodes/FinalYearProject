import 'package:final_year_project/components/main_drawer.dart';
import 'package:final_year_project/screens/posts/post_comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reason.dart';
import '../components/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckIn extends StatefulWidget {
  static const String id = 'check_in_screen';
  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text('Check In'),
        backgroundColor: Colors.green.shade300,
      ),
      drawer: MainDrawer(),
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
                    'How are you feeling today?',
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
              colour: Colors.red.shade300,
              title: 'Stressed 😓',
              onPressed: () {
                // -> Go To Reason Screen
                Navigator.pushNamed(context, NegativeReason.id);
              },
            ),
            RoundButton(
              colour: Colors.red.shade300,
              title: 'Anxious 😥',
              onPressed: () {
                // -> Go To Reason Screen
                Navigator.pushNamed(context, NegativeReason.id);
              },
            ),
            RoundButton(
              colour: Colors.green.shade400,
              title: 'Calm 😄',
              onPressed: () {
                Navigator.pushNamed(context, PostComment.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
