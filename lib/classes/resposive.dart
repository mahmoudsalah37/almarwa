import 'package:flutter/material.dart';

class Responsive {
  Responsive(this.context) {
    size = MediaQuery.of(context).size;
  }
  final BuildContext context;
  Size size;

  ///0 => 100
  double getHeight(double precentage) => size.height * (precentage / 100);
  double getWidth(double precentage) => size.width * (precentage / 100);
}
