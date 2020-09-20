import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CampaignActivateScreen extends StatefulWidget {
  final String campaignId;

  CampaignActivateScreen({this.campaignId});

  @override
  _CampaignActivateScreenState createState() => _CampaignActivateScreenState();
}

class _CampaignActivateScreenState extends State<CampaignActivateScreen> {
  String activateCode;

  @override
  void initState() {
    super.initState();
    getActivateCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 64),
            activateCode != null ? buildQrImage() : CircularProgressIndicator(),
            Spacer(),
            buildUseLaterBtn(context),
          ],
        ),
      ),
    );
  }

  getActivateCode() async {
    final activationCollection =
        FirebaseFirestore.instance.collection("activations");
    final currentUserUID = FirebaseAuth.instance.currentUser.uid;

    final activations = await activationCollection
        .where("userId", isEqualTo: currentUserUID)
        .where("campaignId", isEqualTo: widget.campaignId)
        .get();

    if (activations.docs.length > 0)
      return setState(() {
        activateCode = activations.docs[0].get("activationCode").toString();
      });

    int randomCode = Random().nextInt(899999) + 100000;

    await activationCollection.add({
      "campaignId": widget.campaignId,
      "activationCode": randomCode,
      "userId": currentUserUID,
      "createdAt": Timestamp.now(),
    });

    activateCode = randomCode.toString();
    setState(() {});
  }

  Column buildQrImage() {
    return Column(
      children: [
        QrImage(
          data: activateCode,
          version: QrVersions.auto,
          size: 250.0,
          embeddedImage: AssetImage('assets/logo.png'),
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: Size(40, 40),
          ),
        ),
        Text(activateCode),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarOpacity: 1,
      title: Text(
        "Use the Campaign",
        style: TextStyle(
          fontFamily: "Montserrat",
        ),
      ),
      centerTitle: true,
    );
  }

  Container buildUseLaterBtn(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: FlatButton(
        child: Text(
          "I'll use it later",
          style: TextStyle(fontFamily: "Montserrat"),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
