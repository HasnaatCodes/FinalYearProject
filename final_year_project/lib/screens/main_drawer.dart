import 'package:final_year_project/screens/help_pages/financial_help.dart';
import 'package:final_year_project/screens/help_pages/general_help.dart';
import 'package:final_year_project/screens/post_comment.dart';
import 'package:final_year_project/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'reason.dart';

class MainDrawer extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.green.shade300,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Check In',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              //TODO Sort out this button
              Navigator.of(context).pop();
              Navigator.pushNamed(context, NegativeReason.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.article_rounded),
            title: Text(
              'Posts',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, PostComment.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.messenger_outline_rounded),
            title: Text(
              'Messaging',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.help_outline_outlined),
            title: Text(
              'Help',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              _auth.signOut();
              Navigator.of(context).pop();
              Navigator.pushNamed(context, Welcome.id);
            },
          ),
          //Testing
          ListTile(
            leading: Icon(Icons.money),
            title: Text(
              'Finance',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, FinancialHelp.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_upward),
            title: Text(
              'Stress',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, GeneralHelp.id);
            },
          ),
        ],
      ),
    );
  }
}
