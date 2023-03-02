import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';

ElevatedButton customElevatedButton(
    {required BuildContext context,
    required VoidCallback? onPressed,
    String? text,
    IconData? icon,
    Color backgroundColor = ProjectColorsUtility.projectBackgroundWhite,
    Color foregroundColor = ProjectColorsUtility.eveningStar}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: ProjectBorderRadiusUtility().buttonBorderRadius,
      ),
    ),
    onPressed: onPressed,
    child: Icon(icon),
  );
}
