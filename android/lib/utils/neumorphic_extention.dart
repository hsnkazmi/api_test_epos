import 'package:flutter/material.dart';

extension Neumorphism on Widget {
  DecoratedBox addNeumorphism({
    double borderRadius = 5.0,
    Offset offset = const Offset(5, 5),
    double blurRadius = 5,
    Color topShadowColor = Colors.white60,
    // Color bottomShadowColor = const Color(0x26234395),
    Color bottomShadowColor = Colors.black12,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            color: bottomShadowColor,
          ),
          BoxShadow(
            offset: Offset(-offset.dx, -offset.dx),
            blurRadius: blurRadius,
            color: topShadowColor,
          ),
        ],
      ),
      child: this,
    );
  }
}
