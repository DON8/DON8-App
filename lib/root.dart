import 'package:don8/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  // Will get firebase auth is available or not
  bool auth;

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return Container(color: Colors.red, child: Text("Something error!"));

        if (snapshot.connectionState == ConnectionState.done) {
          FirebaseAuth auth = FirebaseAuth.instance;
          User user = auth.currentUser;

          return user == null ? LoginScreen() : RootScreen();
        }

        return Center(child: CircularProgressIndicator());
      },
    );
    // return auth ? RootScreen() : LoginScreen();
  }
}
