import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
          Center(
            child: Container(
              padding: EdgeInsets.all(12),
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromRGBO(230, 230, 230, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(radius: 64),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "John Doe",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Caffeine Addict",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FaIcon(FontAwesomeIcons.instagram),
                              SizedBox(width: 8),
                              FaIcon(FontAwesomeIcons.facebook),
                              SizedBox(width: 8),
                              FaIcon(FontAwesomeIcons.github),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 12),
                height: 150,
                width: 150,
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.2,
                      cornerStyle: CornerStyle.bothCurve,
                      color: Theme.of(context).primaryColor,
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: 50,
                        color: Theme.of(context).accentColor,
                        cornerStyle: CornerStyle.bothCurve,
                        width: 0.2,
                        sizeUnit: GaugeSizeUnit.factor,
                      )
                    ],
                    annotations: [
                      GaugeAnnotation(
                        positionFactor: 0.1,
                        angle: 90,
                        widget: Text(
                          '5 / 10',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
              Container(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "NEXT TIER",
                      style:
                          TextStyle(fontFamily: "Montserrat", letterSpacing: 6),
                    ),
                    Text(
                      "DON8 ADDICT",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
