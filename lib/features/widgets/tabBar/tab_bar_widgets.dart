import 'package:flutter/material.dart';
import 'package:zero_hunger/features/constant/enums/tabs_enum.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/screens/advert.dart';
import 'package:zero_hunger/features/screens/chat.dart';
import 'package:zero_hunger/features/screens/dashboard.dart';
import 'package:zero_hunger/features/screens/profile.dart';

TabBarView shationTabBarView({required TabController tabController}) => TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: tabController,
      children: const [
        DashboardView(),
        ChatView(),
        AdvertView(),
        ProfileView(),
      ],
    );

TabBar shationTabView({required TabController tabController}) => TabBar(
      physics: const NeverScrollableScrollPhysics(),
      onTap: (index) {},
      padding: EdgeInsets.zero,
      controller: tabController,
      indicatorColor: ProjectColorsUtility.projectBackgroundWhite,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: ProjectColorsUtility.eveningStar,
      unselectedLabelColor: ProjectColorsUtility.onboardBlack,
      tabs: TabViews.values
          .map((e) => Tab(
                icon: IconOfTabs.items[e.index],
              ))
          .toList(),
    );
