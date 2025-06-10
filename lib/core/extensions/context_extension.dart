import 'package:barbar_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../constants/theme.dart';

extension IconExtension on BuildContext {
  AppColors get colors => AppColors();
  ThemeData get appTheme => AppThemes.lightTheme;
  AppTextStyles get styles => appTheme.extension<AppTextStyles>()!;
}
