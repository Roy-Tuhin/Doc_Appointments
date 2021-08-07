import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path=new Path();
    path.lineTo(0, size.height*0.55);
    var start1=Offset(size.width*0.15-50,size.height);
    var end1=Offset(size.width/4,size.height);
    path.quadraticBezierTo(start1.dx, start1.dy, end1.dx, end1.dy);

    var start2=Offset(size.width*0.15 +150,size.height-10);
    var end2=Offset(size.width*0.5+90,size.height*0.75);
    path.quadraticBezierTo(start2.dx, start2.dy, end2.dx, end2.dy);

    var start3=Offset(size.width*0.75+150,size.height*0.25);
    var end3=Offset(size.width,0.5);
    path.quadraticBezierTo(start3.dx, start3.dy, end3.dx, end3.dy);


    path.lineTo(size.width,0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    return false;
  }
}