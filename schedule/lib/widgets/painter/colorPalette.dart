import 'package:flutter/material.dart';

class ColorPalette {
  ColorPalette();
  /// 预设置的颜色色板，用于颜色的生成[背景颜色部分]。
  final List<Color> backgroundColors = [
    Color.fromARGB(255, 255, 242, 192),
    Color.fromARGB(255, 212, 248, 220),
    Color.fromARGB(255, 200, 242, 255),
    Color.fromARGB(255, 254, 222, 225),
    Color.fromARGB(255, 255, 225, 212),
    Color.fromARGB(255, 222, 232, 255),
    Color.fromARGB(255, 242, 212, 242),
    Color.fromARGB(255, 182, 222, 242),
    Color.fromARGB(255, 192, 222, 182)
  ];

  /// 预设置的颜色色板，用于颜色的生成[前景颜色部分]。
  final List<Color> foregroundColors = [
    Color.fromARGB(255, 152, 96, 0),
    Color.fromARGB(255, 102, 154, 122),
    Color.fromARGB(255, 72, 142, 255),
    Color.fromARGB(255, 212, 112, 112),
    Color.fromARGB(255, 245, 112, 112),
    Color.fromARGB(255, 102, 112, 212),
    Color.fromARGB(255, 212, 112, 212),
    Color.fromARGB(255, 45, 145, 225),
    Color.fromARGB(255, 87, 112, 87)
  ];

  int _index = 0;
  Map<String, int> _dic = {};

  int _indexOfKey(String key){
    if(_dic.containsKey(key)){

    } else {
      _dic[key] = _index;
      ++_index;
      if(_index >= backgroundColors.length) {
        _index = 0;
      }
    }

    return _dic[key];
  }

  Color generateBackground(String key){
    return backgroundColors[_indexOfKey(key)];
  }

  Color generateForeground(String key){
    return foregroundColors[_indexOfKey(key)];
  }
}