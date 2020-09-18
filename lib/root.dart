import 'package:don8/screens/screens.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  // Will get firebase auth is available or not
  final bool auth = true;

  @override
  Widget build(BuildContext context) {
    return auth ? RootScreen() : LoginScreen();
  }
}
