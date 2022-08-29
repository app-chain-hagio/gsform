import 'package:flutter/material.dart';
import 'package:gsform/gs_form/enums/filed_required_type.dart';
import 'package:gsform/gs_form/values/colors.dart';
import 'package:gsform/gs_form/values/theme.dart';

class GSFormStyle {
  TextStyle titleTextStyle;
  TextStyle fieldHintStyle;
  TextStyle fieldTextStyle;
  TextStyle errorTextStyle;
  TextStyle helpTextStyle;
  TextStyle sectionTitleStyle;
  GSFieldRequireTypeEnum requireType;
  Color backgroundFieldColor;
  Color backgroundSectionColor;
  Color fieldBorderColor;

  double fieldRadius;
  double sectionRadius;
  double sectionCardElevation;
  double sectionCardPadding;
  String requiredText;

  GSFormStyle({
    TextStyle? titleStyle,
    GSFieldRequireTypeEnum? requireType,
    Color? backgroundFieldColor,
    Color? backgroundSectionColor,
    Color? fieldBorderColor,
    double? fieldRadius,
    double? sectionRadius,
    double? sectionCardElevation,
    double? sectionCardPadding,
    TextStyle? fieldHintStyle,
    TextStyle? fieldTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? helpTextStyle,
    String? requiredText,
    TextStyle? sectionTitleStyle,
  })  : backgroundSectionColor = backgroundSectionColor ?? GSFormColors.white,
        backgroundFieldColor = backgroundFieldColor ?? GSFormColors.colorBackground,
        requireType = requireType ?? GSFieldRequireTypeEnum.star,
        titleTextStyle = titleStyle ?? GSFormTheme.textThemeStyle.displayMedium!,
        fieldRadius = fieldRadius ?? 10.0,
        sectionRadius = sectionRadius ?? 4.0,
        sectionCardElevation = sectionCardElevation ?? 2.0,
        sectionCardPadding = sectionCardPadding ?? 2.0,
        requiredText = requiredText ?? '(required)',
        fieldHintStyle = fieldHintStyle ?? GSFormTheme.textThemeStyle.displayMedium!,
        fieldTextStyle = fieldTextStyle ?? GSFormTheme.textThemeStyle.displayMedium!,
        errorTextStyle = errorTextStyle ?? GSFormTheme.textThemeStyle.headlineSmall!,
        helpTextStyle = helpTextStyle ?? GSFormTheme.textThemeStyle.headlineMedium!,
        sectionTitleStyle = sectionTitleStyle ?? GSFormTheme.textThemeStyle.displayLarge!,
        fieldBorderColor = fieldBorderColor ?? GSFormColors.white;

  static GSFormStyle singleSectionFormDefaultStyle = GSFormStyle(
    backgroundFieldColor: GSFormColors.white,
    sectionCardElevation: 0.0,
    backgroundSectionColor: Colors.transparent,
    sectionCardPadding: 0.0,
    titleStyle: GSFormTheme.textThemeStyle.displayMedium,
    fieldTextStyle: GSFormTheme.textThemeStyle.displayMedium,
    fieldHintStyle: GSFormTheme.textThemeStyle.displaySmall,
    errorTextStyle: GSFormTheme.textThemeStyle.headlineSmall,
    helpTextStyle: GSFormTheme.textThemeStyle.headlineMedium,
    sectionTitleStyle: GSFormTheme.textThemeStyle.displayLarge,
    sectionRadius: 8,
    fieldRadius: 8,
    fieldBorderColor: Colors.white,
  );

  static GSFormStyle singleSectionFormDefaultDarkStyle = GSFormStyle(
    backgroundFieldColor: GSFormColors.black,
    sectionCardElevation: 0.0,
    backgroundSectionColor: Colors.transparent,
    sectionCardPadding: 0.0,
    sectionTitleStyle: GSFormTheme.textThemeDarkStyle.displayLarge,
    titleStyle: GSFormTheme.textThemeDarkStyle.displayMedium,
    fieldTextStyle: GSFormTheme.textThemeDarkStyle.displayMedium,
    fieldHintStyle: GSFormTheme.textThemeDarkStyle.displaySmall,
    errorTextStyle: GSFormTheme.textThemeDarkStyle.headlineSmall,
    helpTextStyle: GSFormTheme.textThemeDarkStyle.headlineMedium,
    sectionRadius: 8,
    fieldRadius: 8,
    fieldBorderColor: Colors.white,
  );

  static GSFormStyle multiSectionFormDefaultStyle = GSFormStyle(
    backgroundFieldColor: GSFormColors.colorBackground,
    sectionCardElevation: 2.0,
    backgroundSectionColor: GSFormColors.white,
    sectionCardPadding: 8.0,
    titleStyle: GSFormTheme.textThemeStyle.displayMedium,
    fieldTextStyle: GSFormTheme.textThemeStyle.displayMedium,
    fieldHintStyle: GSFormTheme.textThemeStyle.displaySmall,
    errorTextStyle: GSFormTheme.textThemeStyle.headlineSmall,
    helpTextStyle: GSFormTheme.textThemeStyle.headlineMedium,
    sectionTitleStyle: GSFormTheme.textThemeStyle.displayLarge,
    sectionRadius: 8,
    fieldRadius: 8,
    fieldBorderColor: Colors.white,
  );

  static GSFormStyle multiSectionFormDefaultDarkStyle = GSFormStyle(
    backgroundFieldColor: GSFormColors.colorBackgroundDark,
    backgroundSectionColor: GSFormColors.black,
    titleStyle: GSFormTheme.textThemeDarkStyle.displayMedium,
    fieldTextStyle: GSFormTheme.textThemeDarkStyle.displayMedium,
    fieldHintStyle: GSFormTheme.textThemeDarkStyle.displaySmall,
    errorTextStyle: GSFormTheme.textThemeDarkStyle.headlineSmall,
    helpTextStyle: GSFormTheme.textThemeDarkStyle.headlineMedium,
    sectionTitleStyle: GSFormTheme.textThemeDarkStyle.displayLarge,
    sectionRadius: 8,
    sectionCardElevation: 2.0,
    sectionCardPadding: 8.0,
    fieldRadius: 8,
    fieldBorderColor: Colors.white,
  );
}
