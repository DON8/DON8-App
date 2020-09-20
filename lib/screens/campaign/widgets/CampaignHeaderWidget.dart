import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CampaignHeader extends StatelessWidget {
  final TabController tabController;
  final String campaignId;
  final String imageUrl;

  CampaignHeader({@required this.tabController, @required this.imageUrl, @required this.campaignId});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      leading: IconButton(
        color: Colors.white60,
        icon: Icon(
          Icons.keyboard_arrow_left,
          size: 42,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.white24,
              child: TabBar(
                controller: tabController,
                labelColor: Colors.white,
                indicatorColor: Theme.of(context).accentColor,
                labelStyle: TextStyle(fontFamily: "Montserrat"),
                tabs: [
                  Tab(text: "DETAILS"),
                  Tab(text: "CONDITIONS"),
                ],
              ),
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: "campaignImage_" + campaignId,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                  stops: [0.5, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.repeated,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
