import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';

class CustomOutlineInputBorder {
  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
        borderSide: const BorderSide(
          width: 3,
          color: ProjectColorsUtility.projectBackgroundWhite,
        ),
      );
}
