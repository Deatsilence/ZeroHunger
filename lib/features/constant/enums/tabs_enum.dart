import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';

class IconOfTabs {
  static final items = <int, Icon>{
    TabViews.dashboard.index: const Icon(
      Icons.home,
      size: ProjectFontSizeUtility.tabBarIconSize,
      color: ProjectColorsUtility.eveningStar,
    ),
    TabViews.chat.index: const Icon(
      Icons.chat_outlined,
      size: ProjectFontSizeUtility.tabBarIconSize,
      color: ProjectColorsUtility.eveningStar,
    ),
    TabViews.advert.index: const Icon(
      Icons.favorite,
      size: ProjectFontSizeUtility.tabBarIconSize,
      color: ProjectColorsUtility.eveningStar,
    ),
    TabViews.profile.index: const Icon(
      Icons.person,
      size: ProjectFontSizeUtility.tabBarIconSize,
      color: ProjectColorsUtility.eveningStar,
    ),
  };
}

enum TabViews { dashboard, chat, advert, profile }
