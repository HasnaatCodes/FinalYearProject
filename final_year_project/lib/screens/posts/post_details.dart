import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class PostDetails extends StatefulWidget {
  static const String id = 'post_details_screen';
  final DocumentSnapshot snapshot;
  final String reference;
  PostDetails({this.snapshot, this.reference});

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final textController = TextEditingController();
  String messageText;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
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
            PostStream(
              snapshot: widget.snapshot,
            ),
            Divider(
              height: 10.0,
              thickness: 5.0,
              color: Colors.green.shade300,
            ),
            ReplyStream(
              reference: widget.reference,
            ),
            Container(
              decoration: textContainerStyle,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: textFieldStyle,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      textController.clear();
                      _firestore
                          .collection('Posts')
                          .document(widget.reference)
                          .collection('replies')
                          .add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                      });
                    },
                    child: Text(
                      'Post Reply',
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

class PostStream extends StatelessWidget {
  final DocumentSnapshot snapshot;

  PostStream({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                child: Text(snapshot.data['title'][0]),
                backgroundColor: Colors.green.shade300,
                foregroundColor: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: Text(
                  snapshot.data['title'],
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.green.shade300,
                  ),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              //Container for the content
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15.0),
          child: Text(
            snapshot.data['content'],
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}

class ReplyStream extends StatelessWidget {
  final String reference;
  ReplyStream({this.reference});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('Posts')
          .document(reference)
          .collection('replies')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightGreenAccent,
            ),
          );
        }
        final replies = snapshot.data.documents.reversed;
        List<ReplyStyle> replyWidgets = [];
        for (var reply in replies) {
          final replyText = reply.data['text'];
          final sender = reply.data['sender'];
          final currentUser = loggedInUser.email;

          final replyWidget = ReplyStyle(
            text: replyText,
            isMe: sender == currentUser,
          );
          replyWidgets.add(replyWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            children: replyWidgets,
          ),
        );
      },
    );
  }
}

class ReplyStyle extends StatelessWidget {
  final String text;
  final bool isMe;

  ReplyStyle({this.text, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            // borderRadius: BorderRadius.circular(30.0),
            borderRadius: BorderRadius.only(
              topRight: isMe ? Radius.circular(0.0) : Radius.circular(30.0),
              topLeft: isMe ? Radius.circular(30.0) : Radius.circular(0.0),
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ),
            color: isMe ? Colors.green.shade300 : Colors.white,
            elevation: 3.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
