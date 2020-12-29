import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/routes/developPage.dart';
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
    UserModel userModel = Provider.of<UserModel>(context);
    return Container(
      child: Column(
        children: [
          SectionTitle(GmLocalizations.of(context).globalSettings),
          SimpleCard.simple(icon: Icons.language, content: gm.language, detail: gm.currentLocale, onTap: () {
            print("click language button -> (Language Page)");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LanguagePage();
            }));
          }),
          SimpleCard.simple(icon: Icons.admin_panel_settings_outlined, content: gm.developSettings, detail: userModel.developOpen ? gm.on: gm.off , onTap: () {
            print("click developSettings button -> (Develop Page)");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DevelopPage();
            }));
          })
        ],
      ),
    );
  }
}
