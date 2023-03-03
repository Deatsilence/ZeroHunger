import 'package:zero_hunger/features/screens/home.dart';
import 'package:zero_hunger/view/auth/login/model/signup_model.dart';
import 'package:zero_hunger/view/auth/login/view/login_view.dart';
import 'package:zero_hunger/view/auth/onboard/view/onboard_view.dart';

class NavigatorRoutes {
  final items = {
    NavigateRoutes.onboard.withParaph: (context) => const OnBoardView(),
    NavigateRoutes.login.withParaph: (context) => const LoginView(),
    NavigateRoutes.signUp.withParaph: (context) => const SignUpView(),
    NavigateRoutes.home.withParaph: (context) => const Home(),
  };
}

enum NavigateRoutes { onboard, login, signUp, home, chat, camera, advert, profile }

extension NavigateRoutesExtension on NavigateRoutes {
  String get justParaph => '/';
  String get withParaph => name;
}
