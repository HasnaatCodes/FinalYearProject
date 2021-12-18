import 'package:final_year_project/components/custom_app_drawer.dart';
import 'package:flutter/material.dart';
import '../../components/info_button.dart';
import '../../components/body_text.dart';
import 'package:url_launcher/url_launcher.dart';

class UsefulContacts extends StatelessWidget {
  static const String id = 'useful_contacts';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text('Useful Contacts'),
        backgroundColor: Colors.green.shade300,
      ),
      drawer: CustomAppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Useful Contacts',
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
                'Here are some useful contacts should you need to speak to someone. You can click on any service and you will be redirected',
              ),
              SizedBox(
                height: 30.0,
              ),
              InfoButton(
                text: 'NHS - (non urgent medical advice)',
                onPressed: () {
                  launch("tel://111");
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              InfoButton(
                text: 'FRANK (Confidential advice on drugs)',
                onPressed: () {
                  launch("tel://0300 123 6600");
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              InfoButton(
                text: 'AskUS Wellbeing and Counselling Service',
                onPressed: () {
                  launch("tel://0300 123 6600");
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              InfoButton(
                text: 'AskUS Bullying, Harassment and Hate Crime Support',
                onPressed: () {
                  launch("tel://0161 295 3333");
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              InfoButton(
                text:
                    'Nightline, listening and support service, run by students',
                onPressed: () {
                  launch('mailto:Nightmail@manchester.nightline.ac.uk');
                },
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
