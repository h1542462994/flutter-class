import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'card/userCard.dart';
import 'package:schedule/widgets/sectionTitle.dart';

class UserComponent extends StatefulWidget {
  @override
  _UserComponentState createState() => _UserComponentState();
}

class _UserComponentState extends State<UserComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SectionTitle(GmLocalizations.of(context).user),
          UserCard(),
          UserCard(),
          UserCard(),
          SectionTitle(GmLocalizations.of(context).userSettings)
        ],
      ),
    );
  }
}
