import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/text_theme_manager.dart';
import 'package:zero_hunger/view/auth/onboard/model/onboard_model.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColorsUtility.projectBackgroundWhite,
      appBar: AppBar(
        backgroundColor: ProjectColorsUtility.projectBackgroundWhite,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              ProjectTextUtility.textOnboardSkip,
              style: TextThemeOnBoardUtility().textThemeOnboard(
                context: context,
                fontSize: OnBoardFontSizeUtility.skipButtonTextFontSize,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: ProjectPaddingUtility().normalHorizontalPadding,
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: screens.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(screens[index].img),
                SizedBox(
                  height: ProjectFontSizeUtility.smallHeight,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: screens.length,
                    itemBuilder: (_, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: _CustomPaddingUtility().smallHorizontalPadding,
                            width: ProjectFontSizeUtility.smallHeight,
                            height: ProjectFontSizeUtility.smallHeight,
                            decoration: BoxDecoration(
                              color: ProjectColorsUtility.eveningStar,
                              borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Text(
                  screens[index].text,
                  textAlign: TextAlign.center,
                  style: TextThemeOnBoardUtility().textThemeOnboard(
                    context: context,
                    fontSize: OnBoardFontSizeUtility.textFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  screens[index].desc,
                  textAlign: TextAlign.center,
                  style: TextThemeOnBoardUtility().textThemeOnboard(
                    context: context,
                    fontSize: OnBoardFontSizeUtility.descFontSize,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: ProjectOnBoardPaddingUtility().nextButtonPadding,
                    decoration: BoxDecoration(
                      color: ProjectColorsUtility.eveningStar,
                      borderRadius: ProjectBorderRadiusUtility().buttonBorderRadius,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ProjectTextUtility.textOnboardNext,
                          style: TextThemeOnBoardUtility().textThemeOnboard(
                            context: context,
                            fontSize: OnBoardFontSizeUtility.nextButtonTextFontSize,
                          ),
                        ),
                        const SizedBox(
                          width: ProjectFontSizeUtility.smallWidth,
                        ),
                        const Icon(
                          Icons.arrow_forward_outlined,
                          color: ProjectColorsUtility.onboardBlack,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CustomPaddingUtility {
  final EdgeInsets smallHorizontalPadding = const EdgeInsets.symmetric(horizontal: 3);
}
