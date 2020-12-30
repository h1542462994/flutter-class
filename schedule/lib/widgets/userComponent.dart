import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/routes/loginPage.dart';
import 'package:schedule/routes/userPage.dart';
import 'package:schedule/widgets/index.dart';
import 'card/userCard.dart';
import 'package:schedule/widgets/sectionTitle.dart';

class UserComponent extends StatefulWidget {
  @override
  _UserComponentState createState() => _UserComponentState();
}

class _UserComponentState extends State<UserComponent> {
  @override
  Widget build(BuildContext context) {
    GmLocalizations gm = GmLocalizations.of(context);
    UserModel userModel = Provider.of<UserModel>(context);
    List<Widget> children = List();
    // modify the children
    children.add(SectionTitle(gm.user));
    if(userModel.noUser) {
      children.add(SimpleCard.simple(icon: Icons.add, content: gm.noLogin, detail: gm.clickToLogin, onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      }));
    } else {
      children.add(SimpleCard.simple(icon: Icons.person, content: userModel.user.user.name, detail: userModel.userState ? gm.userStateOk : gm.userStateFail , onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UserPage();
        }));
      }));
    }
    children.add(SectionTitle(gm.userSettings));
    Column column = Column(children: children,);

    return Container(
      child: column
    );
  }
}
