import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/l18n/gmLocalizations.dart';
import 'package:schedule/notifier/index.dart';
import 'package:schedule/routes/index.dart';

/// 应用主页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody(){
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.timelapse), title: Text(GmLocalizations.of(context).progress)),
          BottomNavigationBarItem(icon: Icon(Icons.extension), title: Text(GmLocalizations.of(context).classTable)),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text(GmLocalizations.of(context).me))
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _body(_selectedIndex),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Widget _body(int value){
    if(value == 0){
      return ProgressPage();
    } else if(value == 1){
      return ClassTablePage();
    } else {
      return MePage();
    }
  }

}
