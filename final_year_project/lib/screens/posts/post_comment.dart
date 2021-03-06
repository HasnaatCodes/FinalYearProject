import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/components/custom_app_drawer.dart';
import 'package:final_year_project/components/show_alert.dart';
import 'package:final_year_project/screens/posts/post_completion.dart';
import 'package:flutter/material.dart';
import '../../components/custom_button.dart';
import '../../constants.dart';

class PostComment extends StatefulWidget {
  static const String id = 'post_comment_screen';
  @override
  _PostCommentState createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {
  final _firestore = Firestore.instance;
  String title;
  String textContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text('Post'),
        backgroundColor: Colors.green.shade300,
      ),
      drawer: CustomAppDrawer(),
      body: SafeArea(
        child: Padding(
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
                height: 10.0,
              ),
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: TextFieldStyle.copyWith(
                  hintText: 'Title',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  textContent = value;
                },
                decoration: TextFieldStyle.copyWith(
                  hintText: 'Write a Comment :)',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomButton(
                colour: Colors.lightGreen,
                title: 'Post',
                onPressed: () {
                  if (textContent == null || title == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please fill in both text fields')));
                  } else {
                    _firestore.collection('Posts').add({
                      'title': title,
                      'content': textContent,
                    });
                    Navigator.pushNamed(context, PostCompletion.id);
                  }
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '(Remember it is anonymous)',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
