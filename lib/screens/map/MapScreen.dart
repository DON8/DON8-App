import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _kGooglePlex,
          scrollGesturesEnabled: false,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
          liteModeEnabled: true,
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
