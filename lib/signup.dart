import 'package:flutter/material.dart';
import 'package:passkeep/gloab.dart';
import 'package:passkeep/lowlevel/Algo.dart';
import 'package:passkeep/viewer.dart';

import 'lowlevel/file.dart';

class Signup extends StatelessWidget {
  Map<String, dynamic> usr = {"usr": "", "pass": ""};
  String pass = "", rpass = "";
  @override
  Widget build(BuildContext context) {
    var textField = TextField(
      cursorColor: Colors.white,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 5,
          ),
        ),
        hintText: 'Username',
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      onChanged: (t) => {usr["usr"] = t},
    );
    return Scaffold(
      backgroundColor: back,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: textField,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    obscureText: true,
                    onChanged: (t) => {pass = t}),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      hintText: 'Re-Enter Password',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    obscureText: true,
                    onChanged: (t) => {rpass = t}),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () => {
                  if (usr["usr"] == "")
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Username is Empty !")))
                    }
                  else if (pass == "" || pass.length < 4)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Password must have minimum 4 characters")))
                    }
                  else if (pass == rpass)
                    {
                      usr["pass"] = hashGen(pass),
                      usr["data"] = [],
                      writeUser(usr),
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => ViewerInit()),
                          (route) => false)
                    }
                  else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Passwords didn\'t match'),
                        backgroundColor: Colors.white,
                      ))
                    }
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
