import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileCard extends StatefulWidget {
  String profileName;
  String tier;
  String instagramUrl;
  String facebookUrl;
  String githubUrl;
  int drankCoffee;

  ProfileCard({
    this.profileName,
    this.tier,
    this.instagramUrl: null,
    this.facebookUrl: null,
    this.githubUrl: null,
  });

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(12),
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromRGBO(230, 230, 230, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(radius: 64),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    widget.profileName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.tier,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.instagramUrl != null)
                          FaIcon(FontAwesomeIcons.instagram),
                        SizedBox(width: 8),
                        if (widget.facebookUrl != null)
                          FaIcon(FontAwesomeIcons.facebook),
                        SizedBox(width: 8),
                        if (widget.githubUrl != null)
                          FaIcon(FontAwesomeIcons.github),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
