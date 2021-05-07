import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExpandedPosts extends StatefulWidget {
  static const String id = 'expanded_posts_screen';
  @override
  _ExpandedPostsState createState() => _ExpandedPostsState();
}

class _ExpandedPostsState extends State<ExpandedPosts> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  String replyText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
        backgroundColor: Colors.green.shade300,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: textContainerStyle,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        replyText = value;
                      },
                      decoration: textFieldStyle,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //replyText
                      _firestore
                          .collection('Posts')
                          .document('DtkOtsjN5cvmvruyovig')
                          .updateData({
                        'reply': replyText,
                      });
                    },
                    child: Text(
                      'Send',
                      style: sendButtonStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
