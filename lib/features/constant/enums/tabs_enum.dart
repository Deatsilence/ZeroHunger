import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';

class IconOfTabs {
  static final items = <int, Widget>{
    TabViews.dashboard.index: const Icon(
      Icons.home,
      size: ProjectFontSizeUtility.tabBarIconSize,
    ),
    TabViews.chat.index: const Icon(
      Icons.chat_outlined,
      size: ProjectFontSizeUtility.tabBarIconSize,
    ),
    TabViews.advert.index: const Icon(
      Icons.favorite,
      size: ProjectFontSizeUtility.tabBarIconSize,
    ),
    TabViews.profile.index: const Icon(
      Icons.person,
      size: ProjectFontSizeUtility.tabBarIconSize,
    ),
  };
}

enum TabViews { dashboard, chat, advert, profile }
