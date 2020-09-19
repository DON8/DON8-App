import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TierCard extends StatefulWidget {
  final int drunkCoffee;
  final int willDrinkCoffee;
  final String nextTier;

  TierCard({this.drunkCoffee, this.willDrinkCoffee, this.nextTier});

  @override
  _TierCardState createState() => _TierCardState();
}

class _TierCardState extends State<TierCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  value: (widget.drunkCoffee / widget.willDrinkCoffee) * 100,
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
                    widget.drunkCoffee.toString() +
                        ' / ' +
                        widget.willDrinkCoffee.toString(),
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
                style: TextStyle(fontFamily: "Montserrat", letterSpacing: 6),
              ),
              Text(
                widget.nextTier,
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
    );
  }
}
