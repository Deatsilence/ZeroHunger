import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/widgets/button/text_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
      ),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
              child: Column(
                children: [
                  Text(
                    "Warning !",
                    textAlign: TextAlign.center,
                    style: TextThemeUtility().textThemeLogin(
                      context: context,
                      fontSize: ProjectFontSizeUtility.normal,
                    ),
                  ),
                  const SizedBox(height: ProjectFontSizeUtility.verySmall),
                  Text(
                    "You can't access this file",
                    textAlign: TextAlign.center,
                    style: TextThemeUtility().textThemeLogin(
                      context: context,
                      fontSize: ProjectFontSizeUtility.normal,
                    ),
                  ),
                  const SizedBox(height: ProjectFontSizeUtility.verySmall),
                  CustomTextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Okay"),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 60,
              child: Icon(Icons.login),
            ),
          ),
        ],
      ),
    );
  }
}
