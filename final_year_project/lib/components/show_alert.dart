import 'package:flutter/material.dart';

class ShowAlertWidget extends StatelessWidget {
  final String error;
  final Function onPressed;

  ShowAlertWidget({this.error, this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return Container(
        color: Colors.green.shade500,
        padding: EdgeInsets.only(
          top: 5.0,
          bottom: 5.0,
        ),
        //padding: EdgeInsets.all(2.0),
        child: Row(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.error_outline_outlined,
                  color: Colors.white,
                )),
            Expanded(
              child: Text(
                error,
                maxLines: 3,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
              onPressed: onPressed,
            ),
          ],
        ),
      );
    }
    return SizedBox(height: 0.0);
  }
}
