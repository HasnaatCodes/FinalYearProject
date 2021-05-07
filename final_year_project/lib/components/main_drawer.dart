import 'package:final_year_project/screens/help_pages/financial_help.dart';
import 'package:final_year_project/screens/help_pages/general_help.dart';
import 'package:final_year_project/screens/posts/posts.dart';
import 'package:final_year_project/screens/welcome.dart';
import '../screens/check_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseUser loggedInUser;

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
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
                  ),
                  Text(
                    loggedInUser.email,
                    style: TextStyle(
                      fontSize: 22,
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
              Navigator.popUntil(context, (route) => false);
              Navigator.pushNamed(context, CheckIn.id);
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
              Navigator.popUntil(context, (route) => false);
              Navigator.pushNamed(context, BlogPosts.id);
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
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              Navigator.popUntil(context, (route) => false);
              Navigator.pushNamed(context, Welcome.id);
              _auth.signOut();
            },
          ),
          //Testing
          ListTile(
            leading: Icon(Icons.money),
            title: Text(
              'Financial Help',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              Navigator.popUntil(context, (route) => false);
              Navigator.pushNamed(context, FinancialHelp.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_upward),
            title: Text(
              'Stress Help',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              Navigator.popUntil(context, (route) => false);
              Navigator.pushNamed(context, GeneralHelp.id);
            },
          ),
        ],
      ),
    );
  }
}
