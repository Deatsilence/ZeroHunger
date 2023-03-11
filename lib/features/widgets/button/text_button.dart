// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Text child;
  MaterialStateProperty<Color>? foregroundColor = MaterialStateProperty.all(ProjectColorsUtility.eveningStar);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: foregroundColor,
      ),
      child: child,
    );
  }
}
