import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';

class DevelopPage extends StatefulWidget {
  @override
  _DevelopPageState createState() => _DevelopPageState();
}

class _DevelopPageState extends State<DevelopPage> {
  TextEditingController _serverController = TextEditingController(text: "");
  bool isLoaded = false;
  UserModel userModel;

  @override void didChangeDependencies() {
    super.didChangeDependencies();
    if(!isLoaded) {
      UserModel userModel = Provider.of<UserModel>(context);
      String text = userModel.server;
      _serverController.text = text;
      _serverController.addListener(() {
        userModel.server = _serverController.text.toString();
      });
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    GmLocalizations gm = GmLocalizations.of(context);
    userModel = Provider.of<UserModel>(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TitleBar(gm.developSettings),
            SimpleCard.withSwitch(icon: Icons.admin_panel_settings_outlined, content: "启用开发者选项", state: userModel.developOpen, onCheck: (state) {
              userModel.developOpen = state;
            }),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              decoration: BoxDecoration(color: MyColors.selectionContent),
              child: TextField(
                controller: _serverController,
                decoration: InputDecoration(
                  labelText: gm.serverDest,
                  hintText: gm.serverDest,
                  icon: Icon(Icons.insert_link)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
