import 'package:flutter/widgets.dart';
import 'package:schedule/common/index.dart';

class ThemeModel extends BaseChangeNotifier {
  ColorSwatch get theme => Global.color;
}