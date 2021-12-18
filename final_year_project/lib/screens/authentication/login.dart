import 'package:final_year_project/components/show_alert.dart';
import 'package:final_year_project/screens/check_in.dart';
import 'package:flutter/material.dart';
import '../../components/custom_button.dart';
import '../../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;

  bool loadingSpinner = false;
  String email;
  String password;
  String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.green.shade300,
      ),
      backgroundColor: Colors.green.shade100,
      body: ModalProgressHUD(
        inAsyncCall: loadingSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Text(
                  'Log In',
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
                onChanged: (value) {
                  email = value;
                },
                decoration: TextFieldStyle.copyWith(
                  hintText: 'Enter your email address',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: TextFieldStyle.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              CustomButton(
                  // colour: Colors.lightGreen,
                  colour: Colors.lightGreen,
                  title: 'Log In',
                  onPressed: () async {
                    if (email == null || password == null) {
                      setState(() {
                        error = 'Fields cannot be empty';
                      });
                    } else {
                      setState(() {
                        loadingSpinner = true;
                      });
                      //Sign the user in
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          //Successfully logged in
                          Navigator.popUntil(context, (route) => false);
                          Navigator.pushNamed(context, CheckIn.id);
                        }
                      } catch (e) {
                        setState(() {
                          // print(e);
                          loadingSpinner = false;
                          if (e.code == 'ERROR_USER_NOT_FOUND') {
                            error = 'Email not found';
                          } else if (e.code == 'ERROR_WRONG_PASSWORD') {
                            error = 'Incorrect password';
                          } else if (e.code == 'ERROR_INVALID_EMAIL') {
                            error = 'Invalid email';
                          } else {
                            error = e.code;
                          }
                        });
                      }
                    }
                  }

                  //Show user a spinner so they can see it is in process

                  //Go to login screen.
                  ),
              ShowAlertWidget(
                error: error,
                onPressed: () {
                  setState(() {
                    error = null;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
