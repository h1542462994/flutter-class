import 'package:flutter/cupertino.dart';
import 'package:schedule/common/index.dart';

class ThemeModel extends BaseChangeNotifier {
  ColorSwatch get theme => Global.color;
}