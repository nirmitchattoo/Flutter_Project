import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/src/painting/image_provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailContoller = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  String email = '', password = '';
  final _auth = FirebaseAuth.instance;
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Image(image: AssetImage('images/neon-sign-welcome-black-background-vector-illustration-145574646.jpg')),
                ),


                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your Email',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: UnderlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                    controller: _emailContoller,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your Password',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: UnderlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),),
                    controller: _passwordController,
                    obscureText: true,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async{
                    email = _emailContoller.text;
                    password = _passwordController.text;
                    try {
                      var user = _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if(user!=null){
                        _emailContoller.clear();
                        _passwordController.clear();
                        Navigator.pushNamed(context, '/login');
                      }
                    }

                    catch(e){
                        print(e);
                    }
                  },
                  child: Text("Create Account"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
