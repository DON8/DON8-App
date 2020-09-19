import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(bottom: 5, top: 40),
                margin: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/logo.png",
                      width: 100,
                      height: 100,
                    ),
                  ],
                )),
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Welcome to DON8",
                  style: TextStyle(fontSize: 25),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RaisedButton(
                          child: Text("Login"),
                          onPressed: () => debugPrint("Test"),
                          color: Color.fromARGB(255, 141, 182, 192),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                      FlatButton(
                        onPressed: () => {debugPrint("Test")},
                        child: Text('Register',
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 182, 192))),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 141, 182, 192),
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(50)),
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}
