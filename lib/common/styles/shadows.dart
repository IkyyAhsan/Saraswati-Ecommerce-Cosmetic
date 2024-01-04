import 'package:flutter/material.dart';
import 'package:saraswati_application_project/utils/constants/colors.dart';

class TShadowStyle {
  static final verticalProdukShow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );


  static final horizontalProdukShow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}