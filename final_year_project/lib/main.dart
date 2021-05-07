import 'package:final_year_project/screens/posts/post_details.dart';
import 'package:final_year_project/screens/posts/expanded_posts.dart';
import 'package:final_year_project/screens/posts/post_completion.dart';
import 'package:final_year_project/screens/posts/posts.dart';

import 'screens/help_pages/financial_help.dart';
import 'screens/help_pages/general_help.dart';
import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/authentication/login.dart';
import 'screens/authentication/registration.dart';
import 'screens/check_in.dart';
import 'screens/reason.dart';
import 'screens/posts/post_comment.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseUser loggedInUser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final UserAuth _auth = UserAuth();
  final bool isSignedIn = await _auth.isSignedIn();
  final MyApp myApp = MyApp(
    initialRoute: isSignedIn ? '/home' : '/',
  );
  runApp(myApp);
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute,
      routes: {
        Welcome.id: (context) => Welcome(),
        '/': (context) => Welcome(),
        Login.id: (context) => Login(),
        Registration.id: (context) => Registration(),
        CheckIn.id: (context) => CheckIn(),
        NegativeReason.id: (context) => NegativeReason(),
        '/home': (context) => CheckIn(),
        FinancialHelp.id: (context) => FinancialHelp(),
        GeneralHelp.id: (context) => GeneralHelp(),
        PostComment.id: (context) => PostComment(),
        BlogPosts.id: (context) => BlogPosts(),
        ExpandedPosts.id: (context) => ExpandedPosts(),
        PostCompletion.id: (context) => PostCompletion(),
        PostDetails.id: (context) => PostDetails(),
      },
    );
  }
}

class UserAuth {
  final _auth = FirebaseAuth.instance;

  Future<bool> isSignedIn() async {
    try {
      final FirebaseUser user = await _auth.currentUser();
      print(user.email);
      return user != null;
    } catch (e) {
      return false;
    }
  }
}
