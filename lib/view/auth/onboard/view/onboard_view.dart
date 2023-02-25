import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/navigator/navigator_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_routes.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/text_theme_manager.dart';
import 'package:zero_hunger/view/auth/onboard/model/onboard_model.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';

part 'part_of_onboard_widgets.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                color: ProjectColorsUtility.projectBackgroundWhite,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: ProjectPaddingUtility().normalHorizontalPadding,
        child: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) => setState(() {
            currentIndex = index;
          }),
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
                            width: currentIndex == index
                                ? OnBoardFontSizeUtility.currentIndexFontSize
                                : ProjectFontSizeUtility.smallWidth,
                            height: ProjectFontSizeUtility.smallHeight,
                            decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? ProjectColorsUtility.peterPan
                                  : ProjectColorsUtility.eveningStar,
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
                    color: ProjectColorsUtility.onboardBlack,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (index == screens.length - 1) {
                      await NavigatorManager.instance.pushToPageFromOnboard(
                        route: NavigateRoutes.home.withParaph,
                      );
                    }
                    await _pageController.nextPage(
                      duration: const Duration(microseconds: 300),
                      curve: Curves.decelerate,
                    );
                  },
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
                            color: ProjectColorsUtility.onboardBlack,
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
