import 'package:final_year_project/screens/main_drawer.dart';
import 'package:flutter/material.dart';
import '../../components/info_button.dart';
import '../../components/body_text.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralHelp extends StatefulWidget {
  static const String id = 'general_help';
  @override
  _GeneralHelpState createState() => _GeneralHelpState();
}

class _GeneralHelpState extends State<GeneralHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text('Stress Help'),
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
                    'How to deal with Stress',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            BodyText(
                'All students face academic stress at some point in their academic career. It is important to take action to minimise the '
                'effects of stress. If you are stressed in general, there is medical advice provided by the NHS on how to deal with stress. '),
            SizedBox(
              height: 20.0,
            ),
            BodyText(
                'If the cause of your stress is academic related, it is better to speak to your tutor directly about your concerns '
                ' You can also speak to the university\'s Wellbeing Advisers or the Counsellors to raise your concerns.'),
            SizedBox(
              height: 20.0,
            ),
            BodyText(
                'Alternatively, you can also post an anonymous comment sharing your thoughts. Others may be able to offer you help.'),
            SizedBox(
              height: 30.0,
            ),
            InfoButton(
              text: 'How to deal with stress - NHS',
              onPressed: () {
                launch(
                    'https://www.nhs.uk/mental-health/feelings-symptoms-behaviours/feelings-and-symptoms/stress/');
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            InfoButton(
              text: 'Wellbeing and Counselling',
              onPressed: () {
                launch(
                    'https://www.salford.ac.uk/askus/support/wellbeing-and-counselling');
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            InfoButton(
              text: 'Share a comment',
              onPressed: () {
                //TODO link to the posts page
              },
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
