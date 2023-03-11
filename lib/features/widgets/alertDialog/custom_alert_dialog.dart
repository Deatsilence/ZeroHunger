// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/widgets/button/text_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.textError,
  }) : super(key: key);

  final String title;
  final String textError;
  final IconData icon = Icons.info_outlined;
  final Color iconColor = ProjectColorsUtility.eveningStar;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _titleText(context),
                  const SizedBox(height: ProjectFontSizeUtility.verySmall),
                  _contentText(context),
                  const SizedBox(height: ProjectFontSizeUtility.verySmall),
                  CustomTextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(ProjectTextUtility.textOkay),
                  ),
                ],
              ),
            ),
          ),
          _alertDialogAvatar(),
        ],
      ),
    );
  }

  Positioned _alertDialogAvatar() {
    return Positioned(
      top: -60,
      child: CircleAvatar(
        backgroundColor: ProjectColorsUtility.onboardBlack,
        radius: 60,
        child: Icon(
          icon,
          size: 50,
          color: iconColor,
        ),
      ),
    );
  }

  Text _contentText(BuildContext context) {
    return Text(
      textError,
      textAlign: TextAlign.center,
      style: TextThemeUtility().textThemeLogin(
        context: context,
        fontSize: ProjectFontSizeUtility.normal,
      ),
    );
  }

  Text _titleText(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextThemeUtility().textThemeLogin(
        context: context,
        fontSize: ProjectFontSizeUtility.big,
      ),
    );
  }
}
