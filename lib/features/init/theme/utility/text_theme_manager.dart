import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';

class TextThemeOnBoardUtility {
  TextStyle? textThemeOnboard(
      {required BuildContext context,
      required double fontSize,
      FontWeight fontWeight = FontWeight.w400,
      Color color = Colors.black87}) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: ProjectColorsUtility.onboardBlack,
        );
  }
}
