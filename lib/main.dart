import 'package:passkeep/entry.dart';
import 'package:passkeep/gloab.dart';
import 'package:passkeep/signup.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Keep',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: mAccent),
      home: Entry(),
    );
  }
}
