import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GlobalKey<GoogleMapStateBase> _key = GlobalKey<GoogleMapStateBase>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          key: _key,
        ),
        Center(
          child: Container(
            height: 250,
            margin: EdgeInsets.all(12),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Icon(Icons.block, color: Colors.red, size: 48),
                    SizedBox(height: 8),
                    Text(
                      "Currently Not Available 😢",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                        "To complete the project during hackathon, we will add this feature in future. Don't worry. We're really dedicated to this project. Anything it takes to let people DON8!"),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
