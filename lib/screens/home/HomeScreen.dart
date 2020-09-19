import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      appBar: PreferredSize(
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
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          CarouselSlider(
            items: [
              ClipRRect(
                child: Image.network("https://dummyimage.com/600x400/fff/000"),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              ClipRRect(
                child: Image.network("https://dummyimage.com/600x400/000/fff"),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
            ],
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 10),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
