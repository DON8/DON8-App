import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CampaignActivateScreen extends StatefulWidget {
  final String campaignId;

  CampaignActivateScreen({this.campaignId});

  @override
  _CampaignActivateScreenState createState() => _CampaignActivateScreenState();
}

class _CampaignActivateScreenState extends State<CampaignActivateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarOpacity: 1,
        title: Text(
          "Use the Campaign",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 64),
            QrImage(
              data: "TEST",
              version: QrVersions.auto,
              size: 250.0,
              embeddedImage: AssetImage('assets/logo.png'),
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: Size(40, 40),
              ),
            ),
            Text("TEST"),
            SizedBox(height: 256),
            FlatButton(
              child: Text(
                "I'll use it later",
                style: TextStyle(fontFamily: "Montserrat"),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
