import 'package:flutter/material.dart';

class ColorPalette {
  ColorPalette();
  /// 预设置的颜色色板，用于颜色的生成[背景颜色部分]。
  final List<Color> backgroundColors = [
    Color.fromARGB(255, 255, 242, 180),
    Color.fromARGB(255, 172, 248, 212),
    Color.fromARGB(255, 180, 220, 172),
    Color.fromARGB(255, 254, 180, 225),
    Color.fromARGB(255, 254, 223, 172),
    Color.fromARGB(255, 172, 192, 224),
    Color.fromARGB(255, 232, 187, 187),
    Color.fromARGB(255, 255, 192, 87),
    Color.fromARGB(255, 120, 200, 212),
    Color.fromARGB(255, 225, 212, 98)
  ];

  /// 预设置的颜色色板，用于颜色的生成[前景颜色部分]。
  final List<Color> foregroundColors = [
    Color.fromARGB(255, 152, 96, 0),
    Color.fromARGB(255, 126, 172, 168),
    Color.fromARGB(255, 128, 172, 120),
    Color.fromARGB(255, 212, 128, 200),
    Color.fromARGB(255, 245, 127, 156),
    Color.fromARGB(255, 128, 140, 200),
    Color.fromARGB(255, 220, 142, 142),
    Color.fromARGB(255, 240, 110, 100),
    Color.fromARGB(255, 88, 157, 192),
    Color.fromARGB(255, 200, 172, 87)
  ];

  int _index = 0;
  Map<String, int> _dic = {};

  int _indexOfKey(String key){
    if(_dic.containsKey(key)){

    } else {
      if(_index > backgroundColors.length) {
        _index = 0;
      }
      _dic[key] = _index;
      ++_index;
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