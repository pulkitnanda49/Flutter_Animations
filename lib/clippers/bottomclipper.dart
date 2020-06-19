import 'package:flutter/material.dart';

class BottomClipper extends CustomClipper<Path> {
  Path getInitialPath(Size size) {
    final Path path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width - 100, 0.0);

    var arcend = Offset(size.width - 130.0, size.height);
    path.arcToPoint(
      arcend,
      radius: Radius.circular(size.height * 0.6),
      clockwise: false,
    );

    path.lineTo(size.width - 90.0, size.height);
    path.lineTo(size.width, size.height);

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
