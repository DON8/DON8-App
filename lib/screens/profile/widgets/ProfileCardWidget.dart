import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileCard extends StatefulWidget {
  final String profileName;
  final String tier;
  final String instagramUrl;
  final String facebookUrl;
  final String githubUrl;
  final int drankCoffee;

  ProfileCard({
    this.profileName,
    this.tier,
    this.instagramUrl: '',
    this.facebookUrl: '',
    this.githubUrl: '',
    this.drankCoffee,
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
                        if (widget.instagramUrl.isNotEmpty)
                          FaIcon(FontAwesomeIcons.instagram),
                        SizedBox(width: 8),
                        if (widget.facebookUrl.isNotEmpty)
                          FaIcon(FontAwesomeIcons.facebook),
                        SizedBox(width: 8),
                        if (widget.githubUrl.isNotEmpty)
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
