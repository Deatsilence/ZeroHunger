import 'package:flutter/material.dart';
import 'package:zero_hunger/features/constant/enums/tabs_enum.dart';
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
      onTap: (index) {},
      padding: EdgeInsets.zero,
      controller: tabController,
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: TabViews.values
          .map((e) => Tab(
                icon: IconOfTabs.items[e.index],
              ))
          .toList(),
    );
