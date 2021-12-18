import 'package:final_year_project/components/custom_app_drawer.dart';
import 'package:final_year_project/screens/posts/post_comment.dart';

import '../screens/help_pages/financial_help.dart';
import '../screens/help_pages/general_help.dart';
import 'package:flutter/material.dart';
import '../components/custom_button.dart';

class NegativeReason extends StatefulWidget {
  static const String id = 'reason_screen';
  @override
  _NegativeReasonState createState() => _NegativeReasonState();
}

class _NegativeReasonState extends State<NegativeReason> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text('Reason'),
        backgroundColor: Colors.green.shade300,
      ),
      drawer: CustomAppDrawer(),
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
                    'What is bothering you?',
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
            CustomButton(
              colour: Colors.red.shade300,
              title: 'Financial Stress',
              onPressed: () {
                Navigator.pushNamed(context, FinancialHelp.id);
              },
            ),
            CustomButton(
              colour: Colors.red.shade300,
              title: 'Academic Stress',
              onPressed: () {
                Navigator.pushNamed(context, GeneralHelp.id);
              },
            ),
            CustomButton(
              colour: Colors.red.shade300,
              title: 'Loneliness',
              onPressed: () {
                Navigator.pushNamed(context, PostComment.id);
              },
            ),
            CustomButton(
              colour: Colors.red.shade300,
              title: 'Other',
              onPressed: () {
                // Navigator.pushNamed(context, Registration.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
