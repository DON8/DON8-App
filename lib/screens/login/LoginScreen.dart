import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  bool _autoValidate = false;
  bool _isObscured = true;
  String _errorMessage = "";
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 5, top: 40),
                margin: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/logo.png",
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Welcome to DON8",
                  style: TextStyle(fontSize: 25, fontFamily: "Montserrat"),
                ),
              ),
              Form(
                key: this._formKey,
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      buildEmailField(),
                      SizedBox(height: 16),
                      buildPasswordField(),
                      SizedBox(height: 8),
                      buildErrorMessage()
                    ],
                  ),
                ),
              ),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Center buildErrorMessage() {
    return Center(
      child: Text(
        _errorMessage,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        fillColor: Colors.black12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.black12,
            width: 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).accentColor,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
              !_isObscured ? Icons.lock_open_outlined : Icons.lock_outline),
          onPressed: toggleObscure,
        ),
        filled: true,
      ),
      validator: (val) {
        if (val.isEmpty) return "Password can not be empty";
        return null;
      },
      obscureText: _isObscured,
      onChanged: (val) => password = val,
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "E-mail Address",
        fillColor: Colors.black12,
        hintText: 'example@example.com',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.black12,
            width: 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).accentColor,
          ),
        ),
        filled: true,
      ),
      validator: (val) {
        return validateEmail(val)
            ? null
            : "Please enter correct e-mail address";
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: (val) => email = val,
    );
  }

  toggleObscure() {
    _isObscured = !_isObscured;
    setState(() {});
  }

  validateEmail(value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  login() async {
    validateInputs();

    if (!_formKey.currentState.validate()) return;

    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      _errorMessage = e.message;
    }
    setState(() {});
  }

  Container loginButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text("Login",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.white,
                )),
            onPressed: login,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
        ],
      ),
    );
  }
}
