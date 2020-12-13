import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:schedule/common/index.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/widgets/index.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var localeModel = Provider.of<LocaleModel>(context);
    var gm = GmLocalizations.of(context);

    Widget _buildLanguageItem(String language, String value) {
      return ListTile(
        title: Text(
          language,
          style: TextStyle(color: localeModel.locale == value ? color : null),
        ),
        trailing:
          localeModel.locale == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          localeModel.locale = value;
        },
      );
    }
    return Scaffold(
      body:  Container(
        child: Column(
          children: [
          TitleBar("语言"),
          _buildLanguageItem(Const.chineseSimplified, "zh_CN"),
          _buildLanguageItem(Const.english, "en_US"),
          _buildLanguageItem(Const.japanese, "ja_JP"),
          _buildLanguageItem(gm.localeAuto, null)
          ],
          ),
        ),
    );

  }

}
