import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final BuildContext context;
  final VoidCallback? onPressed;
  final String? text;
  final IconData? icon;
  final Color backgroundColor;
  final Color foregroundColor;

  const CustomElevatedButton({
    super.key,
    required this.context,
    required this.onPressed,
    this.text,
    this.icon,
    this.backgroundColor = ProjectColorsUtility.projectBackgroundWhite,
    this.foregroundColor = ProjectColorsUtility.eveningStar,
  });

  @override
  Widget build(BuildContext context) {
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
    final List<Widget> children = [];

    if (icon != null) {
      children.add(Icon(icon));
    }

    if (text != null) {
      if (children.isNotEmpty) {
        children.add(const SizedBox(width: 8));
      }
      children.add(Text(text));
    }

    return children;
  }
}

List<Widget> _textOrIcons(BuildContext context, String? text, IconData? icon) {
  return [
    icon != null ? Icon(icon) : const SizedBox.shrink(),
    const SizedBox(width: 5),
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
  ];
}
