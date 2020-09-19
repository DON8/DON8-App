import 'package:don8/screens/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final sliderItems = [
    ClipRRect(
      child: Image.network("https://dummyimage.com/600x400/fff/000"),
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    ClipRRect(
      child: Image.network("https://dummyimage.com/600x400/000/fff"),
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Campaigns",
                          style:
                              TextStyle(fontFamily: "Montserrat", fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                        Icon(Icons.keyboard_arrow_right, size: 36),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Table(
                  children: [
                    TableRow(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Card(
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Image.network(
                                    "https://dummyimage.com/300x300/000/fff",
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Buy a coffee, another one is free!",
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "Starbucks",
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
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Card(
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Image.network(
                                    "https://dummyimage.com/300x300/000/fff",
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Buy a coffee, another one is free!",
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "Starbucks",
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
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: FlatButton(
                    textColor: Theme.of(context).accentColor,
                    child: Text(
                      "Check More Campaigns",
                      style: TextStyle(fontFamily: "Montserrat"),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
