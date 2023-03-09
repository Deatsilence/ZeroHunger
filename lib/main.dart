import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero_hunger/features/constant/enums/tabs_enum.dart';
import 'package:zero_hunger/features/init/cache/shared_preferences_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/services/firebase_options.dart';
import 'package:zero_hunger/features/widgets/tabBar/tab_bar_widgets.dart';

int? isViewed;

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt(SharedKeys.onboard.name);

  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shation',
      theme: ThemeData(
        bottomAppBarTheme: const BottomAppBarTheme(
          height: ProjectFontSizeUtility.tabBarHeight,
          color: ProjectColorsUtility.projectBackgroundWhite,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ProjectColorsUtility.eveningStar,
        ),
      ),
      home: const HomeView(), //isViewed != 0 ? const OnBoardView() : const LoginView(),
      // initialRoute: isViewed != 0 ? NavigateRoutes.onboard.withParaph : NavigateRoutes.login.withParaph,
      // routes: NavigatorRoutes().items,
      // navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 8;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.camera_alt_rounded),
          onPressed: () {},
        ),
        bottomNavigationBar: SafeArea(
          child: BottomAppBar(
            notchMargin: _notchedValue,
            shape: const CircularNotchedRectangle(),
            child: shationTabView(tabController: _tabController),
          ),
        ),
        body: shationTabBarView(tabController: _tabController),
      ),
    );
  }
}
