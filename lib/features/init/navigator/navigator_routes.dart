import 'package:zero_hunger/features/screens/add_advert.dart';
import 'package:zero_hunger/features/screens/advert.dart';
import 'package:zero_hunger/features/screens/advert_detail.dart';
import 'package:zero_hunger/features/screens/chat.dart';
import 'package:zero_hunger/features/screens/chatting.dart';
import 'package:zero_hunger/features/screens/dashboard.dart';
import 'package:zero_hunger/features/screens/profile.dart';
import 'package:zero_hunger/features/screens/splash.dart';
import 'package:zero_hunger/main.dart';
import 'package:zero_hunger/view/auth/login/view/login_view.dart';
import 'package:zero_hunger/view/auth/login/view/signup_view.dart';
import 'package:zero_hunger/view/auth/onboard/view/onboard_view.dart';

class NavigatorRoutes {
  final items = {
    NavigateRoutes.onboard.withParaph: (context) => const OnBoardView(),
    NavigateRoutes.splash.withParaph: (context) => const SplashView(),
    NavigateRoutes.login.withParaph: (context) => const LoginView(),
    NavigateRoutes.signUp.withParaph: (context) => const SignUpView(),
    NavigateRoutes.home.withParaph: (context) => const HomeView(),
    NavigateRoutes.dashboard.withParaph: (context) => const DashboardView(),
    NavigateRoutes.chat.withParaph: (context) => const ChatView(),
    NavigateRoutes.advert.withParaph: (context) => const AdvertView(),
    NavigateRoutes.profile.withParaph: (context) => const ProfileView(),
    NavigateRoutes.addAdvert.withParaph: (context) => const AddAdvert(),
    NavigateRoutes.advertDetail.withParaph: (context) => const AdvertDetail(),
    NavigateRoutes.chatting.withParaph: (context) => const ChattingView(),
  };
}

enum NavigateRoutes {
  onboard,
  splash,
  login,
  signUp,
  home,
  dashboard,
  chat,
  chatting,
  advertDetail,
  addAdvert,
  advert,
  profile
}

extension NavigateRoutesExtension on NavigateRoutes {
  String get justParaph => '/';
  String get withParaph => "/$name";
}
