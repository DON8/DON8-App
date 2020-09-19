import 'package:don8/screens/profile/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 48),
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ProfileCard(
            profileName: "John Doe",
            tier: "Caffeine Addict",
          ),
          SizedBox(height: 12),
          TierCard(
              drunkCoffee: 5, willDrinkCoffee: 10, nextTier: "DON8 ADDICT"),
          SizedBox(height: 128),
          statsButton(context)
        ],
      ),
    );
  }

  Center statsButton(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Text("Statistics"),
        onPressed: () {},
        textColor: Colors.white,
        color: Theme.of(context).accentColor,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 48),
      ),
    );
  }
}
