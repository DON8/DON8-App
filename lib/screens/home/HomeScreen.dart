import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:don8/models/models.dart';
import 'package:don8/screens/home/widgets/widgets.dart';
import 'package:don8/screens/screens.dart';
import 'package:don8/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final sliderItems = <Widget>[];

  @override
  void initState() {
    super.initState();
    loadSliders();
  }

  loadSliders() async {
    final snapshot = await firestore
        .collection("sliders")
        .where("place", isEqualTo: null)
        .get();

    List<dynamic> images = snapshot.docs[0].get("images");

    images.forEach((element) {
      sliderItems.add(
        ClipRRect(
          child: CachedNetworkImage(imageUrl: element.toString()),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      );
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: ListView(
        children: [
          Transform.translate(
            offset: Offset(0, -32),
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
          Center(
              child: sliderItems.isEmpty
                  ? CircularProgressIndicator()
                  : CustomCarouselSlider(items: sliderItems)),
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

  LimitedBox campaignsList() {
    return LimitedBox(
      maxHeight: 200,
      child: StreamBuilder<QuerySnapshot>(
          stream: Campaign.getCollection().snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null)
              return Center(child: CircularProgressIndicator());

            return ListView.builder(
              itemCount:
                  snapshot.data.docs.length > 4 ? 5 : snapshot.data.docs.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                if (i == 4)
                  return IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: goToCompaigns,
                  );

                return Container(
                  width: 150,
                  child: CampaignCard(
                    campaignId: snapshot.data.docs[i].id,
                    campaignOwner: snapshot.data.docs[i].get("campaignOwner"),
                    campaignText: snapshot.data.docs[i].get("campaignName"),
                    imageUrl: snapshot.data.docs[i].get("imageUrl"),
                  ),
                );
              },
            );
          }),
    );
  }
}
