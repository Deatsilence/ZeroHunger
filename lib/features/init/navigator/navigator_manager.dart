import 'package:flutter/material.dart';

class NavigatorManager {
  NavigatorManager._();

  static NavigatorManager instance = NavigatorManager._();

  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPageFromOnboard({required String route, Object? arguments}) async {
    await _navigatorGlobalKey.currentState?.pushReplacementNamed(route, arguments: arguments);
  }
}
