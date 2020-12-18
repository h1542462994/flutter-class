// 存储全局信息
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schedule/data/index.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/repository/index.dart';
import 'package:schedule/seed/exampleGenerator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schedule/models/index.dart';

class Global {
  /// initialize the global services for the application.
  static Future init() async {
    // To initialize the global state
    ExampleGenerator exampleGenerator = ExampleGenerator();
    termGroup = exampleGenerator.generateTermGroup();
    color = Colors.blue;

    /// get the sharedPreferences
    _prefs = await SharedPreferences.getInstance();
    /// load the storage data
    // _prefs.clear();
    var _profile = _prefs.getString("profile");
    if  (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch(e) {
        print(e);
      }
    }
    profile = exampleGenerator.initializeProfile(profile);
  }

  static saveProfile() {
    _prefs.setString("profile", jsonEncode(profile.toJson()));
  }


  static DbManager dbManager;
  static TermGroup termGroup;
  static MaterialColor color;
  /// 轻量级键值对存储
  static SharedPreferences _prefs;
  static Locale defaultLocale;
  static Profile profile = Profile();
}

class BaseChangeNotifier extends ChangeNotifier {
  Profile get profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); // save the profile.
    super.notifyListeners(); // notify the widgets to update.
  }
}