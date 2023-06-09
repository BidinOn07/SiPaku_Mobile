// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedContainer extends StatelessWidget {
  Widget? child;
  Color? color;
  double? width;
  double? height;
  EdgeInsets? padding;
  EdgeInsets? margin;
  bool? hasBorder;
  bool? hasShadow;
  int? radius;

  RoundedContainer({
    super.key,
    this.child,
    this.color,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.hasBorder = false,
    this.radius = 10,
    this.hasShadow = true,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(0),
      margin: margin ?? const EdgeInsets.all(0),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(radius!.toDouble())),
        border: hasBorder!
            ? Border.all(
                color: Colors.black,
                width: 1,
              )
            : null,
        boxShadow: hasShadow!
            ? [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 48,
                  offset: const Offset(0, 40), // changes position of shadow
                ),
              ]
            : null,
      ),
      child: child ?? const SizedBox(),
    );
  }
}
