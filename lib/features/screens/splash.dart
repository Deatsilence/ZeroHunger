import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/navigator/navigator_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_routes.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/lottie_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/viewModel/profile_view_model.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with FirebaseAuthManagerMixin {
  final UserViewModel uvm = UserViewModel();

  @override
  void initState() {
    super.initState();
    checkUserAvailable().then((avaliable) async {
      if (avaliable) {
        await Future.delayed(const Duration(seconds: 3));
        await NavigatorManager.instance.pushToReplacementNamedPage(route: NavigateRoutes.home.withParaph);
      } else {
        await NavigatorManager.instance.pushToReplacementNamedPage(route: NavigateRoutes.login.withParaph);
      }
    });
  }

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
