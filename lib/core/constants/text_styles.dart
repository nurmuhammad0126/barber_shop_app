import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  // Size 10
  final TextStyle s10w400;
  final TextStyle s10w500;
  final TextStyle s10w600;

  // Size 12
  final TextStyle s12w400;
  final TextStyle s12w500;
  final TextStyle s12w600;

  // Size 14
  final TextStyle s14w400;
  final TextStyle s14w500;
  final TextStyle s14w600;

  // Size 16
  final TextStyle s16w400;
  final TextStyle s16w500;
  final TextStyle s16w600;

  // Size 18
  final TextStyle s18w400;
  final TextStyle s18w500;
  final TextStyle s18w600;

  // Size 20
  final TextStyle s20w400;
  final TextStyle s20w500;
  final TextStyle s20w600;

  // Size 24
  final TextStyle s24w400;
  final TextStyle s24w500;
  final TextStyle s24w600;

  const AppTextStyles({
    required this.s10w400,
    required this.s10w500,
    required this.s10w600,
    required this.s12w400,
    required this.s12w500,
    required this.s12w600,
    required this.s14w400,
    required this.s14w500,
    required this.s14w600,
    required this.s16w400,
    required this.s16w500,
    required this.s16w600,
    required this.s18w400,
    required this.s18w500,
    required this.s18w600,
    required this.s20w400,
    required this.s20w500,
    required this.s20w600,
    required this.s24w400,
    required this.s24w500,
    required this.s24w600,
  });

  @override
  AppTextStyles copyWith({
    TextStyle? s10w400,
    TextStyle? s10w500,
    TextStyle? s10w600,
    TextStyle? s12w400,
    TextStyle? s12w500,
    TextStyle? s12w600,
    TextStyle? s14w400,
    TextStyle? s14w500,
    TextStyle? s14w600,
    TextStyle? s16w400,
    TextStyle? s16w500,
    TextStyle? s16w600,
    TextStyle? s18w400,
    TextStyle? s18w500,
    TextStyle? s18w600,
    TextStyle? s20w400,
    TextStyle? s20w500,
    TextStyle? s20w600,
    TextStyle? s24w400,
    TextStyle? s24w500,
    TextStyle? s24w600,
  }) {
    return AppTextStyles(
      s10w400: s10w400 ?? this.s10w400,
      s10w500: s10w500 ?? this.s10w500,
      s10w600: s10w600 ?? this.s10w600,
      s12w400: s12w400 ?? this.s12w400,
      s12w500: s12w500 ?? this.s12w500,
      s12w600: s12w600 ?? this.s12w600,
      s14w400: s14w400 ?? this.s14w400,
      s14w500: s14w500 ?? this.s14w500,
      s14w600: s14w600 ?? this.s14w600,
      s16w400: s16w400 ?? this.s16w400,
      s16w500: s16w500 ?? this.s16w500,
      s16w600: s16w600 ?? this.s16w600,
      s18w400: s18w400 ?? this.s18w400,
      s18w500: s18w500 ?? this.s18w500,
      s18w600: s18w600 ?? this.s18w600,
      s20w400: s20w400 ?? this.s20w400,
      s20w500: s20w500 ?? this.s20w500,
      s20w600: s20w600 ?? this.s20w600,
      s24w400: s24w400 ?? this.s24w400,
      s24w500: s24w500 ?? this.s24w500,
      s24w600: s24w600 ?? this.s24w600,
    );
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) => this;

  static const defaultStyle = AppTextStyles(
    s10w400: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s10w500: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s10w600: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s12w400: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s12w500: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s12w600: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s14w400: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s14w500: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s14w600: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s16w400: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s16w500: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s16w600: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s18w400: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s18w500: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s18w600: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s20w400: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s20w500: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s20w600: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s24w400: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s24w500: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
    s24w600: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'AtypText',
      color: Colors.white,
    ),
  );
}
