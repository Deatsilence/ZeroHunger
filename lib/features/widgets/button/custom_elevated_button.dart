import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';

ElevatedButton customElevatedButton({
  required BuildContext context,
  required VoidCallback? onPressed,
  String? text,
  IconData? icon,
  Color backgroundColor = ProjectColorsUtility.projectBackgroundWhite,
  Color foregroundColor = ProjectColorsUtility.eveningStar,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: ProjectColorsUtility.eveningStar,
          width: 2,
        ),
        borderRadius: ProjectBorderRadiusUtility().buttonBorderRadius,
      ),
    ),
    onPressed: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: _textOrIcons(context, text, icon),
    ),
  );
}

List<Widget> _textOrIcons(BuildContext context, String? text, IconData? icon) {
  return [
    text != null
        ? Text(
            text,
            style: TextThemeUtility().textThemeLogin(
                context: context,
                fontSize: ProjectFontSizeUtility.small,
                color: ProjectColorsUtility.eveningStar,
                fontWeight: FontWeight.bold),
          )
        : const SizedBox.shrink(),
    icon != null ? Icon(icon) : const SizedBox.shrink(),
  ];
}
