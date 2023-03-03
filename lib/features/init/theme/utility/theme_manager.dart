import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';

class TextThemeUtility {
  TextStyle? textThemeOnboard({
    required BuildContext context,
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color color = ProjectColorsUtility.onboardBlack,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        );
  }

  TextStyle? textThemeLogin({
    required BuildContext context,
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color color = ProjectColorsUtility.onboardBlack,
  }) {
    return textThemeOnboard(
      context: context,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
