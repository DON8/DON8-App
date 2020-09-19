import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  final Function onPressed;

  HeadingWidget({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: FlatButton(
        onPressed: onPressed == null ? () {} : onPressed,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontFamily: "Montserrat", fontSize: 18),
              textAlign: TextAlign.start,
            ),
            if (onPressed != null) Icon(Icons.keyboard_arrow_right, size: 36),
          ],
        ),
      ),
    );
  }
}
