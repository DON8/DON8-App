import 'dart:ui';

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
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPortrait ? 2 : 3,
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            child: CampaignCard(
              imageUrl: items[index].imageUrl,
              campaignText: items[index].campaignName,
              campaignOwner: items[index].campaignOwner,
              campaignId: items[index].campaignId,
            ),
          );
        },
      ),
    );
  }
}
