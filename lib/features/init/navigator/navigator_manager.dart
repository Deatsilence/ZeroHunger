import 'package:flutter/material.dart';

class NavigatorManager {
  NavigatorManager._();

  static NavigatorManager instance = NavigatorManager._();

  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPageFromOnboard({required String route, Object? arguments}) async {
    await _navigatorGlobalKey.currentState?.pushReplacementNamed(route, arguments: arguments);
  }

  Future<void> pushToPage({required BuildContext context, required StatefulWidget view}) async {
    await _navigatorGlobalKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }

  Future<void> pushNamedToPage({required String route, Object? arguments}) async {
    await _navigatorGlobalKey.currentState?.pushNamed(route);
  }
}
