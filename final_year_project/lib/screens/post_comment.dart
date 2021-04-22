import 'package:final_year_project/screens/main_drawer.dart';

import '../components/body_text.dart';
import 'package:flutter/material.dart';
import '../components/round_button.dart';
import '../constants.dart';

class PostComment extends StatefulWidget {
  static const String id = 'post_comment_screen';
  @override
  _PostCommentState createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text('Post'),
        backgroundColor: Colors.green.shade300,
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Text(
                'Share how you are feeling?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45.0,
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
              decoration: TextFieldStyle.copyWith(
                hintText: 'Write a Comment :)',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundButton(
              // colour: Colors.lightGreen,
              colour: Colors.lightGreen,
              title: 'Post',
              onPressed: () {
                //TODO post functionality
              },
              //Go to login screen.
            ),
            SizedBox(
              height: 100.0,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BodyText(
                '(Remember it is anonymous)',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
