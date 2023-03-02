part of 'onboard_view.dart';

class _OnboardSkipTextButton extends StatelessWidget {
  const _OnboardSkipTextButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await _manager.saveIntOnboardInfo(key: SharedKeys.onboard);
        NavigatorManager.instance.pushToPageFromOnboard(route: NavigateRoutes.home.withParaph);
      },
      child: Text(
        ProjectTextUtility.textOnboardSkip,
        style: TextThemeUtility().textThemeOnboard(
          context: context,
          fontSize: OnBoardFontSizeUtility.skipButtonTextFontSize,
          color: ProjectColorsUtility.projectBackgroundWhite,
        ),
      ),
    );
  }
}

class _OnboardPageListViewBuilder extends StatelessWidget {
  const _OnboardPageListViewBuilder({
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: screens.length,
      itemBuilder: (_, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: _CustomPaddingUtility().smallHorizontalPadding,
              width: currentIndex == index ? OnBoardFontSizeUtility.currentIndexFontSize : ProjectFontSizeUtility.small,
              height: ProjectFontSizeUtility.verySmall,
              decoration: BoxDecoration(
                color: currentIndex == index ? ProjectColorsUtility.peterPan : ProjectColorsUtility.eveningStar,
                borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
              ),
            ),
          ],
        );
      },
    );
  }
}

Text _onboardDescriptionText(int index, BuildContext context) {
  return Text(
    screens[index].desc,
    textAlign: TextAlign.center,
    style: TextThemeUtility().textThemeOnboard(
      context: context,
      fontSize: OnBoardFontSizeUtility.descFontSize,
      color: ProjectColorsUtility.onboardBlack,
    ),
  );
}

Text _onboardTitleText(int index, BuildContext context) {
  return Text(
    screens[index].text,
    textAlign: TextAlign.center,
    style: TextThemeUtility().textThemeOnboard(
      context: context,
      fontSize: OnBoardFontSizeUtility.textFontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}

class _OnboardNextButton extends StatelessWidget {
  const _OnboardNextButton({
    required PageController pageController,
    required int index,
  })  : _pageController = pageController,
        _index = index;

  final PageController _pageController;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await _manager.saveIntOnboardInfo(key: SharedKeys.onboard);
        if (_index == screens.length - 1) {
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
              _index == 2 ? ProjectTextUtility.textOnboardGetStarted : ProjectTextUtility.textOnboardNext,
              style: TextThemeUtility().textThemeOnboard(
                context: context,
                fontSize: OnBoardFontSizeUtility.nextButtonTextFontSize,
                color: ProjectColorsUtility.onboardBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomPaddingUtility {
  final EdgeInsets smallHorizontalPadding = const EdgeInsets.symmetric(horizontal: 3);
}
