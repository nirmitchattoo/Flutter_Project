import 'package:flutter/material.dart';
import 'package:loginportal/login.dart';
import 'package:loginportal/register.dart';
import 'package:loginportal/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes:{
        '/register':(context)=> Register(),
        '/login':(context)=>Login(),
        '/welcome':(context)=>Welcome(),
      }
    );
  }
}

