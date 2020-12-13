import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _uidController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GmLocalizations gm = GmLocalizations.of(context);
    UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
        body: Container(
          child: Column(
            children: [
              TitleBar(gm.login),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: true,
                        controller: _uidController,
                        decoration: InputDecoration(
                          labelText: gm.uid,
                          hintText: gm.uid,
                          icon: Icon(Icons.person)
                        ),
                        validator: (value) {
                          if(value.isEmpty) {
                            return gm.uidEmpty;
                          } else if(value.length < 2 || value.length > 20) {
                            return gm.uidRange;
                          } else if(!RegExp(r'^[a-zA-Z0-9_]*$').hasMatch(value)){
                            return gm.uidReg;
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: gm.password,
                          hintText: gm.password,
                          icon: Icon(Icons.lock)
                        ),
                        // 密码模式
                        obscureText: true,
                        validator: (value) {
                          if(value.isEmpty) {
                            return gm.passwordEmpty;
                          } else if(value.length < 6 || value.length > 128) {
                            return gm.passwordRange;
                          }
                          return null;
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 28.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Builder(builder: (context) {
                                return RaisedButton(
                                  padding: EdgeInsets.all(16),
                                  child: Text(gm.login),
                                  color: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    print("click login button");
                                    if(Form.of(context).validate()) {
                                      Net(userModel).login(_uidController.text, _passwordController.text).then((value) => print(value));
                                    }
                                  },
                                );
                              },),
                            )
                        ],
                      ),),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Row(
                          children: [
                            Expanded(child: RaisedButton(
                              padding: EdgeInsets.all(16),
                              child: Text("Register"),
                              color: Colors.white,
                              textColor: Colors.black87,
                              onPressed: () {
                                print("click register button");
                              },
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        )
    );
  }
}
