import 'package:don8/models/campaign.dart';
import 'package:don8/screens/campaign/widgets/widgets.dart';
import 'package:don8/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CampaignScreen extends StatefulWidget {
  final Campaign campaign;

  CampaignScreen({this.campaign});

  @override
  _CampaignScreenState createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  List<Widget> tabs;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tabs = [
      Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              widget.campaign.campaignName,
              style: TextStyle(fontFamily: "Montserrat", fontSize: 24),
            ),
            SizedBox(height: 16),
            Card(
              color: Theme.of(context).primaryColor,
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.donate),
                title: Text("You will DON8 a coffee per buy"),
                trailing: CircleAvatar(child: Text("8")),
              ),
            ),
            SizedBox(height: 8),
            Card(
              color: Theme.of(context).primaryColor,
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.donate),
                title: Text("You will get discount"),
                trailing: CircleAvatar(child: Text("50%")),
              ),
            ),
            SizedBox(height: 64),
            Center(
              child: Column(
                children: [
                  Text(
                    "32₺",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontFamily: "Montserrat",
                        fontSize: 18),
                  ),
                  Stack(
                    children: [
                      Text(
                        "16₺",
                        style:
                            TextStyle(fontSize: 64, fontFamily: "Montserrat"),
                      ),
                      Positioned(
                        child: CircleAvatar(child: Text("50%")),
                        bottom: 0,
                        right: 0,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CampaignActivateScreen(
                        campaignId: widget.campaign.campaignId,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Use",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                  ),
                ),
                elevation: 0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                padding: EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
      Container(),
    ];

    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (context, boxIsScrolled) {
          return [
            CampaignHeader(
              campaignId: widget.campaign.campaignId,
              imageUrl: widget.campaign.imageUrl,
              tabController: _tabController,
            ),
          ];
        },
        body: TabBarView(children: tabs, controller: _tabController),
      ),
    );
  }
}
