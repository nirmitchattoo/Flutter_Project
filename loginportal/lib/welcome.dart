
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final TextEditingController _quotecontroller = new TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedinuser;
  late String myquote = '';
  String displayQuote = '';

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinuser = user;
        print(loggedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  /*void getQuote() async {
   // print('nirmit');
    await for (var snapshot in _firestore.collection('Quotes').snapshots()) {
       for (var quote in snapshot.docs) {
        print(snapshot.metadata);
        displayQuote=quote.get('myquote');
      }
      //print('jai mata di');
    }
  }*/
  void getQuote()async{
    await for (var snapshot in _firestore.collection('Quotes').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.get('myquote'));

        }
        }
}

  @override
  void initstate() {
    super.initState();
    getCurrentUser();
    getQuote();
  }

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Enter your Quote"),
              controller: _quotecontroller,
            ),
            MaterialButton(
              onPressed: () {
                myquote = _quotecontroller.text;
                _firestore.collection('Quotes').add({
                  'myquote': myquote,
                });
                _quotecontroller.clear();
              },
              child: Text('This is my quote'),
            ),
            Text(displayQuote),
          ],
        ),
      ),
    );
  }
}
