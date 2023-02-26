import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/cache/shared_preferences_manager.dart';
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

late final SharedManager _manager;

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
    _manager = SharedManager();
    _initialize();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _initialize() async {
    await _manager.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColorsUtility.projectBackgroundWhite,
      appBar: AppBar(
        backgroundColor: ProjectColorsUtility.projectBackgroundWhite,
        elevation: 0,
        actions: const [
          _OnboardSkipTextButton(),
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
                  child: _OnboardPageListViewBuilder(currentIndex: currentIndex),
                ),
                _onboardTitleText(index, context),
                _onboardDescriptionText(index, context),
                _OnboardNextButton(
                  pageController: _pageController,
                  index: index,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
