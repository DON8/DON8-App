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
            CircleAvatar(
              radius: 64,
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                getInitials(widget.profileName).toString(),
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ),
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

  String getInitials(string) {
    List<String> names = string.split(" ");
    String initials = "";
    int numWords = 2;

    if (numWords < names.length) {
      numWords = names.length;
    }
    for (var i = 0; i < numWords; i++) {
      initials += '${names[i][0]}';
    }
    return initials;
  }
}
