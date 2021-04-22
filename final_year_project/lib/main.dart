import 'screens/help_pages/financial_help.dart';
import 'screens/help_pages/general_help.dart';
import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/login.dart';
import 'screens/registration.dart';
import 'screens/check_in.dart';
import 'screens/reason.dart';
import 'screens/post_comment.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

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
    return MaterialApp(
      initialRoute: loggedInUser == null ? Welcome.id : NegativeReason.id,
      // initialRoute: Login.id,
      // initialRoute: Registration.id,
      // initialRoute: NegativeReason.id,
      //initialRoute: FinancialHelp.id,
      //initialRoute: GeneralHelp.id,
      // initialRoute: PostComment.id,
      routes: {
        Welcome.id: (context) => Welcome(),
        Login.id: (context) => Login(),
        Registration.id: (context) => Registration(),
        CheckIn.id: (context) => CheckIn(),
        NegativeReason.id: (context) => NegativeReason(),
        FinancialHelp.id: (context) => FinancialHelp(),
        GeneralHelp.id: (context) => GeneralHelp(),
        PostComment.id: (context) => PostComment(),
      },
    );
  }
}
