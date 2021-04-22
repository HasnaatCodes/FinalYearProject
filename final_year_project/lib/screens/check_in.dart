import 'package:final_year_project/screens/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reason.dart';
import '../components/round_button.dart';

class CheckIn extends StatefulWidget {
  static const String id = 'check_in_screen';
  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
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
              title: 'Positive 😄',
              onPressed: () {
                // -> Go To Post Screen
                //TODO set a positive screen message
                //Navigator.pushNamed(context, NegativeReason.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
