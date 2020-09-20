import 'package:cached_network_image/cached_network_image.dart';
import 'package:don8/models/campaign.dart';
import 'package:don8/screens/screens.dart';
import 'package:flutter/material.dart';

class CampaignCard extends StatelessWidget {
  final String imageUrl;
  final String campaignText;
  final String campaignOwner;
  final String campaignId;

  CampaignCard({
    this.imageUrl,
    this.campaignText,
    this.campaignOwner,
    this.campaignId,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: Card(
        child: InkWell(
          onTap: () => goToCampaignScreen(context),
          child: Column(
            children: [
              Hero(
                tag: "campaignImage_" + campaignId,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      campaignText,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 2),
                    Text(
                      campaignOwner,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToCampaignScreen(context) {
    final campaign = Campaign(
      imageUrl: imageUrl,
      campaignId: campaignId,
      campaignName: campaignText,
      campaignOwner: campaignOwner,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CampaignScreen(campaign: campaign),
      ),
    );
  }
}
