import 'package:flutter/material.dart';
import 'package:saraswati_application_project/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key, 
    this.width = 400, 
    this.height = 400, 
    this.radius = 400, 
    this.padding = 0,
    this.backgroundColor = TColors.white, 
    this.child, 
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: TColors.textWhite.withOpacity(0.1)
      ),
      child: child,
    );
  }
}