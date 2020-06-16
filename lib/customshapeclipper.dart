import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  List<Offset> curve1, curve2, curve3;

  Offset getCoordinates(double t, List<Offset> curve) {
    Offset p0 = curve[0], p1 = curve[1], p2 = curve[2];
    double x = ((1 - t) * (((1 - t) * p0.dx) + (t * p1.dx))) +
        (t * (((1 - t) * p1.dx) + (t * p2.dx)));
    double y = ((1 - t) * (((1 - t) * p0.dy) + (t * p1.dy))) +
        (t * (((1 - t) * p1.dy) + (t * p2.dy)));
    return Offset(x, y);
  }

  Offset generateOffset(double progress) {
    if (progress <= 0.3) {
      return getCoordinates(progress / 0.3, curve1);
    } else if (progress <= 0.6) {
      return getCoordinates((progress - 0.32) / 0.3, curve2);
    } else if (progress <= 1.0) {
      return getCoordinates((progress - 0.60) / 0.3, curve3);
    }
  }

  Path getInitialPath(Size size) {
    curve1 = [
      Offset(0.0, size.height),
      Offset(size.width * 0.1, size.height - 75.0),
      Offset(size.width * 0.35, size.height - 55.0),
    ];

    curve2 = [
      Offset(size.width * 0.35, size.height - 55.0),
      Offset(size.width * 0.62, size.height - 30.0),
      Offset(size.width * 0.7, size.height - 100.0),
    ];

    curve3 = [
      Offset(size.width * 0.7, size.height - 100.0),
      Offset(size.width * 0.85, size.height - 210.0),
      Offset(size.width, size.height - 200.0),
    ];

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
