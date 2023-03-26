import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/lottie_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColorsUtility.projectBackgroundWhite,
      body: splashBody(context),
    );
  }
}

Widget? splashBody(BuildContext context) => Center(
      child: SafeArea(
        child: Padding(
          padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: ProjectLottieUtility().lottieLoading,
            ),
          ),
        ),
      ),
    );
