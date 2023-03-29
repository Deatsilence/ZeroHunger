import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zero_hunger/features/init/cache/shared_preferences_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_routes.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/view/auth/onboard/model/onboard_model.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/view/auth/onboard/viewModel/onboard_view_model.dart';

part 'part_of_onboard_widgets.dart';

final OnboardViewModel _ovm = OnboardViewModel();

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
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
      backgroundColor: ProjectColorsUtility.onboardWhite,
      appBar: AppBar(
        backgroundColor: ProjectColorsUtility.onboardWhite,
        elevation: 0,
        actions: const [
          _OnboardSkipTextButton(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: ProjectPaddingUtility().normalHorizontalPadding,
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) => _ovm.increaseCurrentIndex(index),
            itemCount: screens.length,
            itemBuilder: (context, index) {
              return Observer(builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(screens[index].img),
                    SizedBox(
                      height: ProjectFontSizeUtility.verySmall,
                      child: _OnboardPageListViewBuilder(currentIndex: _ovm.currentIndex),
                    ),
                    _onboardTitleText(index, context),
                    _onboardDescriptionText(index, context),
                    _OnboardNextButton(
                      pageController: _pageController,
                      index: index,
                    ),
                  ],
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
