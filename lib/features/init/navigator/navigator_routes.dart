import 'package:zero_hunger/features/screens/home.dart';

class NavigatorRoutes {
  final items = {NavigateRoutes.home.withParaph: (context) => const Home()};
}

enum NavigateRoutes { login, home, chat, camera, advert, profile }

extension NavigateRoutesExtension on NavigateRoutes {
  String get justParaph => '/';
  String get withParaph => '/$name';
}
