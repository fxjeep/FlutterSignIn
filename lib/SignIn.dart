import 'package:BTest/google_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign In"),
        ),
        body: Center(
            child: new ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new GoogleSignInWidget(),
            ],
          )
        ])));
  }
}
