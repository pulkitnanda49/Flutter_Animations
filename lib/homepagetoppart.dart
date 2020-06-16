import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:liquid_ui/liquid_ui.dart';

import 'CustomPainter.dart';
import 'customshapeclipper.dart';

class HOmePageTopPart extends StatelessWidget {
  final double progress;

  const HOmePageTopPart({Key key, this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final clipper = CustomShapeClipper();
    clipper.getInitialPath(Size(mq.width, 300.0));

    return Stack(
      children: [
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 300.0,
            decoration: BoxDecoration(color: Color(0xffe0edff)),
          ),
        ),
        CustomPaint(
          painter: MyCustomPainter(
            clipper.generateOffset(progress),
          ),
          child: Container(),
        ),
        Positioned(
            bottom: 65.0,
            left: 20.0,
            child: LText('\l.quote.bold.small{Clothes}')),
        Positioned(
            bottom: 75.0,
            left: 155.0,
            child: LText('\l.quote.bold.small{Electronics}')),
        Positioned(
            top: 70.0, right: 20.0, child: LText('\l.quote.bold.small{Shoes}')),
      ],
    );
  }
}
