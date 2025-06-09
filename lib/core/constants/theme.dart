import 'package:flutter/material.dart';

import 'text_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    extensions: [AppTextStyles.defaultStyle],
    fontFamily: "AtypText",
    scaffoldBackgroundColor: Colors.black,
  );
}
