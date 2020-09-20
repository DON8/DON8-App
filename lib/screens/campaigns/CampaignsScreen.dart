import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:don8/models/models.dart';
import 'package:don8/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CampaignsScreen extends StatefulWidget {
  @override
  _CampaignsScreenState createState() => _CampaignsScreenState();
}

class _CampaignsScreenState extends State<CampaignsScreen> {
  final items = <Campaign>[
    Campaign(
      campaignId: "0",
      campaignOwner: "Starbucks",
      campaignName: "Buy one, free one",
      imageUrl: "https://dummyimage.com/1920x1080/000/fff",
    ),
    Campaign(
      campaignId: "1",
      campaignOwner: "Starbucks",
      campaignName: "Buy one, free one",
      imageUrl: "https://dummyimage.com/1920x1080/000/fff",
    ),
    Campaign(
      campaignId: "2",
      campaignOwner: "Starbucks",
      campaignName: "Buy one, free one",
      imageUrl: "https://dummyimage.com/1920x1080/000/fff",
    ),
    Campaign(
      campaignId: "3",
      campaignOwner: "Starbucks",
      campaignName: "Buy one, free one",
      imageUrl: "https://dummyimage.com/1920x1080/000/fff",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text("Campaigns", style: TextStyle(fontFamily: "Montserrat")),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Campaign.getCollection().snapshots(),
          builder: (context, snapshot) {
            return GridView.builder(
              itemCount: snapshot.data.docs.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPortrait ? 2 : 3,
              ),
              itemBuilder: (context, i) {
                return Container(
                  child: CampaignCard(
                    imageUrl: snapshot.data.docs[i].get("imageUrl"),
                    campaignText: snapshot.data.docs[i].get("campaignName"),
                    campaignOwner: snapshot.data.docs[i].get("campaignOwner"),
                    campaignId: snapshot.data.docs[i].id,
                  ),
                );
              },
            );
          }),
    );
  }
}
