import 'package:flutter/material.dart';
import 'package:test_animations/customshapeclipper.dart';

class DescriptionClipper extends CustomClipper<Path> {
  Path getInitialPath(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    var firstendpoint = Offset(size.width * 0.35, size.height - 55.0);
    var firstcontrolpoint = Offset(size.width * 0.1, size.height - 75.0);
    path.quadraticBezierTo(firstcontrolpoint.dx, firstcontrolpoint.dy,
        firstendpoint.dx, firstendpoint.dy);
    var secondendpoint = Offset(size.width * 0.7, size.height - 100.0);
    var secondcontrolpoint = Offset(size.width * 0.62, size.height - 30.0);
    path.quadraticBezierTo(secondcontrolpoint.dx, secondcontrolpoint.dy,
        secondendpoint.dx, secondendpoint.dy);
    var thirdendpoint = Offset(size.width, size.height - 200.0);
    var thirdcontrolpoint = Offset(size.width * 0.85, size.height - 210.0);
    path.quadraticBezierTo(thirdcontrolpoint.dx, thirdcontrolpoint.dy,
        thirdendpoint.dx, thirdendpoint.dy);

    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  getClip(Size size) {
    final path = getInitialPath(size);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
