import 'package:cached_network_image/cached_network_image.dart';
import 'package:don8/screens/home/widgets/widgets.dart';
import 'package:don8/screens/screens.dart';
import 'package:don8/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final sliderItems = [
    ClipRRect(
      child: CachedNetworkImage(
          imageUrl: "https://dummyimage.com/700x400/fff/000"),
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    ClipRRect(
      child: CachedNetworkImage(
          imageUrl: "https://dummyimage.com/700x400/000/fff"),
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: ListView(
        children: [
          Transform.translate(
            offset: Offset(0, -30),
            child: PreferredSize(
              preferredSize: new Size.fromHeight(72),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(48),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Image.asset("assets/logo.png", height: 72),
                ),
              ),
            ),
          ),
          Center(child: CustomCarouselSlider(items: sliderItems)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingWidget(
                  title: "Campaigns",
                  onPressed: goToCompaigns,
                ),
                SizedBox(height: 8),
                campaignsList(),
                SizedBox(height: 8),
                HeadingWidget(
                  title: "Coffees & Restaurants Near You",
                ),
                closeCoffeesList(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  goToCompaigns() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CampaignsScreen()));
  }

  Container closeCoffeesList() {
    return Container(
      height: 190,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 150,
            child: RestaurantCard(
              imageUrl: "https://dummyimage.com/300x300/000/fff",
              restaurantName: "Starbucks",
            ),
          ),
          Container(
            width: 150,
            child: RestaurantCard(
              imageUrl: "https://dummyimage.com/300x300/000/fff",
              restaurantName: "Starbucks",
            ),
          ),
          Container(
            width: 150,
            child: RestaurantCard(
              imageUrl: "https://dummyimage.com/300x300/000/fff",
              restaurantName: "Starbucks",
            ),
          ),
          Container(
            width: 150,
            child: RestaurantCard(
              imageUrl: "https://dummyimage.com/300x300/000/fff",
              restaurantName: "Starbucks",
            ),
          ),
        ],
      ),
    );
  }

  Container campaignsList() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 150,
            child: CampaignCard(
              campaignId: "0",
              campaignOwner: "Starbucks",
              campaignText: "Buy one, free one",
              imageUrl: "https://dummyimage.com/300x300/000/fff",
            ),
          ),
          Container(
            width: 150,
            child: CampaignCard(
              campaignId: "0",
              campaignOwner: "Starbucks",
              campaignText: "Buy one, free one",
              imageUrl: "https://dummyimage.com/300x300/000/fff",
            ),
          ),
          Container(
            width: 150,
            child: CampaignCard(
              campaignId: "0",
              campaignOwner: "Starbucks",
              campaignText: "Buy one, free one",
              imageUrl: "https://dummyimage.com/300x300/000/fff",
            ),
          ),
          Container(
            width: 150,
            child: CampaignCard(
              campaignId: "0",
              campaignOwner: "Starbucks",
              campaignText: "Buy one, free one",
              imageUrl: "https://dummyimage.com/300x300/000/fff",
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: goToCompaigns,
          ),
        ],
      ),
    );
  }
}
