import 'dart:async';
import 'package:final_year_project/screens/posts/post_comment.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/components/custom_app_drawer.dart';
import 'package:final_year_project/screens/posts/post_details.dart';

class BlogPosts extends StatefulWidget {
  static const String id = 'blog_posts_screen';
  @override
  _BlogPostsState createState() => _BlogPostsState();
}

class _BlogPostsState extends State<BlogPosts> {
  bool searchState = false;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =
      Firestore.instance.collection('Posts');

  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.documents;
      });
    });
  }

  void passData(DocumentSnapshot snap) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PostDetails(
              snapshot: snap,
              reference: snap.documentID,
            )));
  }

  void searchText(String text) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, PostComment.id);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: !searchState
            ? Text('Posts')
            : TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onChanged: (text) {
                  searchText(text);
                },
              ),
        backgroundColor: Colors.green.shade300,
        actions: <Widget>[
          !searchState
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      searchState = !searchState;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      searchState = !searchState;
                    });
                  },
                ),
        ],
      ),
      drawer: CustomAppDrawer(),
      body: Container(
        decoration: BoxDecoration(),
        child: ListView.builder(
          itemCount: snapshot?.length ?? 0,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0.0,
              color: Colors.transparent.withOpacity(0.1),
              margin: EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      child: Text(
                        snapshot[index].data['title'][0],
                      ),
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.black,
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Container(
                      width: 210.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            child: Text(
                              snapshot[index].data['title'],
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              //we want to pass data to details screen
                              passData(snapshot[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
