import 'package:flutter/material.dart';

class TaskHomeCard extends CustomClipper<Path> {
  final double avatarRadius;
  final double borderRadius;
  TaskHomeCard({this.avatarRadius = 20, this.borderRadius = 40});

  @override
  Path getClip(Size size) {
    final path = Path();

    //SUPERIOR DIREITO
    path.moveTo(0.0, 0.0);

    path.lineTo(size.width - 150, 0.0);

    path.quadraticBezierTo(310, 00, 310, 50);
    path.quadraticBezierTo(310, 90, 360, 90);
    path.quadraticBezierTo(412, 90, 415, 150);

    //INFERIOR DIREITA
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(420, 410, 420, 440);
    path.quadraticBezierTo(420, 360, 340, 360);

    //INFERIOR ESQUERDA
    path.lineTo(80, 360);
    path.quadraticBezierTo(0.0, 360, 0.0, 300);

    //INFERIOR ESQUERDA
    path.lineTo(0.0, 25);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
