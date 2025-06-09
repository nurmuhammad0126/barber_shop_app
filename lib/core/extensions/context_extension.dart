import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../constants/theme.dart';

extension IconExtension on BuildContext {
  ThemeData get appTheme => AppThemes.lightTheme;
  AppTextStyles get styles => appTheme.extension<AppTextStyles>()!;
}
