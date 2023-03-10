// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';

class CustomOutlineInputBorder {
  CustomOutlineInputBorder({
    this.borderColor = ProjectColorsUtility.projectBackgroundWhite,
    this.borderWidth = 3,
  });

  final Color borderColor;
  final double borderWidth;

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
        borderSide: BorderSide(
          width: borderWidth,
          color: borderColor,
        ),
      );
}
