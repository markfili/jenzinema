import 'package:flutter/material.dart';

import 'fonts.dart';
import 'j_colors.dart';

class Themes {
  Themes._();

  static ThemeData jtheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: Fonts.sfProDisplay,
    scaffoldBackgroundColor: JColors.background,
  );
}
