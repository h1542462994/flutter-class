import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:ui' as ui;

class MyPaints {
  static Paint get grayLinePaint => Paint()
  ..color = Colors.black12 // 画笔颜色
  ..strokeCap = StrokeCap.square // 画笔笔触类型
  ..isAntiAlias = true // 是否启动抗锯齿
  ..style = PaintingStyle.fill // 央视
  ..strokeWidth = 1.0; // 画笔的宽度

  static ui.Paragraph buildParagraph(String text, double width, {double fontSize = 10, bool bold = false, bool blue = false}){
    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          textAlign: TextAlign.center,
          fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: fontSize,
        )
    );
    paragraphBuilder.pushStyle(ui.TextStyle(color: blue ? Colors.blue : Colors.black54));
    paragraphBuilder.addText(text);
    ui.ParagraphConstraints paragraphConstraints = ui.ParagraphConstraints(width: width);
    return paragraphBuilder.build()..layout(paragraphConstraints);
  }
}