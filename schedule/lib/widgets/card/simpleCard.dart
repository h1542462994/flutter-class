import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule/common/myColors.dart';
import 'package:schedule/data/index.dart';

class SimpleCard extends StatelessWidget {
  SimpleCard({this.icon, this.content, this.secondContent, this.rightIcon = Icons.keyboard_arrow_right, this.rightIconShown = true, this.onTap});

  final IconData icon;
  final Widget content;
  final Widget secondContent;
  final IconData rightIcon;
  final bool rightIconShown;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: MyColors.selectionContent,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Icon(icon),
            ),
            Expanded(
              child: content,
            ),
            secondContent,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                rightIcon,
                color: rightIconShown? Colors.blueGrey: Colors.transparent,
              ),
            ),

          ],
        ),
      )
    );
  }

  static SimpleCard simple({IconData icon, String content, String detail = "", bool rightIconShown = true, Function onTap}) {
    return SimpleCard(
      icon: icon,
      content: Text(content,
        textScaleFactor: 0.9),
      secondContent: Text(detail,
        style: TextStyle(
          color: Colors.grey)
        ),
      rightIconShown: rightIconShown,
      onTap: onTap,
    );
  }

  static SimpleCard withSwitch({IconData icon, String content, bool state , Function onCheck}) {
    return SimpleCard(
      icon: icon,
      content: Text(content,
        textScaleFactor: 0.9),
      secondContent: Switch(
        value: state,
        onChanged: (value) {
          state = value;
          onCheck(value);
        },
      ),
      rightIconShown: false,
    );
  }
}
