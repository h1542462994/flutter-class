import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    GmLocalizations gm = GmLocalizations.of(context);
    UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TitleBar(gm.user),
            RaisedButton(
              padding: EdgeInsets.all(16),
              child: Text(gm.exitLogin),
              onPressed: () {
                userModel.exitLogin();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
