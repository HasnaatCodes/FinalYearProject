import 'package:final_year_project/components/main_drawer.dart';
import 'package:final_year_project/screens/posts/posts.dart';
import 'package:flutter/material.dart';
import '../../components/round_button.dart';

class PostCompletion extends StatelessWidget {
  static const String id = 'post_completion_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text('Successfully Posted'),
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
                'Post was successfully posted ✅',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundButton(
              // colour: Colors.lightGreen,
              colour: Colors.lightGreen,
              title: 'Return to posts',
              onPressed: () {
                Navigator.pushNamed(context, BlogPosts.id);
              },
              //Go to login screen.
            ),
          ],
        ),
      ),
    );
  }
}
