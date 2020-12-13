import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/routes/index.dart';
import 'package:schedule/widgets/card/simpleCard.dart';
import 'package:schedule/widgets/sectionTitle.dart';

class SettingsComponent extends StatefulWidget {
  @override
  _SettingsComponentState createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  @override
  Widget build(BuildContext context) {
    GmLocalizations gm = GmLocalizations.of(context);
    return Container(
      child: Column(
        children: [
          SectionTitle(GmLocalizations.of(context).globalSettings),
          SimpleCard.simple(icon: Icons.language, content: gm.language, detail: gm.currentLocale, onTap: () {
            print("点击了 语言");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LanguagePage();
            }));
          })
        ],
      ),
    );
  }
}
