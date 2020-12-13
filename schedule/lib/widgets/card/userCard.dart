import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule/common/myColors.dart';

/// 一张用户卡片
class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.selectionContent,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.ac_unit_sharp),)
          ,
          Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Text("点击登录",
                        textScaleFactor: 0.9,
                        style: TextStyle(
                            color: Colors.black54
                        ),
                      ),
                    ),
                    Text("1231231241532124134",
                        style: TextStyle(
                            color: Colors.black26
                        ))
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )
          ),
          Text(
            "请重新登录",
            style: TextStyle(
              color: Colors.deepOrangeAccent
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            // child: Text(
            //   "请重新登录",
            //   style: TextStyle(
            //     color: Colors.deepOrangeAccent
            //   ),
            // ),
            child: Icon(
              Icons.check,
              color: Colors.blueGrey,
            ),
          )

        ],
      ),
    );
  }
}
