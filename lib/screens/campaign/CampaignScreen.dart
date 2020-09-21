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
  List<Map<String, String>> _details;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);

    widget.campaign.loadDetails().then((details) {
      print(details);
      _details = details;
      setState(() {});
    });
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
            if (_details != null)
              Container(
                child: ListView.builder(
                  itemCount: widget.campaign.details.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Card(
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.donate),
                        title: Text(_details[i]["detail"]),
                        trailing: CircleAvatar(
                          child: Text(_details[i]["detail_trailer"]),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    );
                  },
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
