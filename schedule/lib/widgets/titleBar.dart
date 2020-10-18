import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  TitleBar(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.red),
      child: Padding(
        padding: EdgeInsets.only(top: 42, bottom: 24),
        child: Center(
          child: Text(title,
            textScaleFactor: 0.9,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
        ),
      ),
    );
  }
}
