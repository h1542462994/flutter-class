import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule/common/myColors.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.selectionTitle,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title,
            textScaleFactor: 0.8,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
