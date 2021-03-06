import 'package:final_year_project/screens/check_in.dart';
import 'package:final_year_project/components/show_alert.dart';
import 'package:flutter/material.dart';
import '../../components/custom_button.dart';
import '../../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Registration extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _Registration createState() => _Registration();
}

class _Registration extends State<Registration> {
  final _auth = FirebaseAuth.instance;

  bool loadingSpinner = false;
  String email;
  String password;
  String status = 'Student';
  final statusList = ['Student', 'Lecturer', 'Other'];
  String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
              // Flexible(
              //   child: Hero(
              //     tag: 'logo',
              //     child: Container(
              //       height: 200.0,
              //       child: Image.asset('images/logo.png'),
              //     ),
              //   ),
              // ),
              Flexible(
                child: Text(
                  'Registration',
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
              DropdownButton(
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18.0,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.green,
                ),
                items: statusList
                    .map((String item) => DropdownMenuItem<String>(
                          child: Text(item),
                          value: item,
                        ))
                    .toList(),
                onChanged: (String value) {
                  setState(() {
                    this.status = value;
                  });
                },
                value: status,
              ),
              SizedBox(
                height: 8.0,
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
                  title: 'Register',
                  onPressed: () async {
                    if (email == null || password == null) {
                      setState(() {
                        error = 'Fields cannot be empty';
                      });
                    } else {
                      setState(() {
                        loadingSpinner = true;
                      });
                      //Only proceed once the user has been created
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          //Successfully created User
                          Navigator.popUntil(context, (route) => false);
                          Navigator.pushNamed(context, CheckIn.id);
                        }
                        setState(() {
                          loadingSpinner = false;
                        });
                      } catch (e) {
                        setState(() {
                          print(e);
                          loadingSpinner = false;
                          if (e.code == 'ERROR_INVALID_EMAIL') {
                            error = 'Invalid Email';
                          } else if (e.code == 'ERROR_MISSING_EMAIL') {
                            error = 'Please enter an email address';
                          } else if (e.code == 'ERROR_WEAK_PASSWORD') {
                            error = 'Password too short. Minimum 6 characters';
                          } else {
                            error = e.code;
                          }
                        });
                      }
                    }
                  }),
              Flexible(
                child: ShowAlertWidget(
                  error: error,
                  onPressed: () {
                    setState(() {
                      error = null;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
