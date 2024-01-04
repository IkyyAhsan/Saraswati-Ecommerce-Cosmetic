import 'package:flutter/material.dart';
import 'package:saraswati_application_project/utils/theme/widget_themes/text_theme.dart';
import 'package:saraswati_application_project/utils/theme/widget_themes/appbar_theme.dart';
import 'package:saraswati_application_project/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:saraswati_application_project/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:saraswati_application_project/utils/theme/widget_themes/chip_theme.dart';
import 'package:saraswati_application_project/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:saraswati_application_project/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:saraswati_application_project/utils/theme/widget_themes/text_field_theme.dart';
class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color.fromRGBO(255, 140, 149, 1),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(255, 140, 149, 1),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}