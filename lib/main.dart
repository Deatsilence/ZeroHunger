import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero_hunger/features/constant/enums/tabs_enum.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/cache/shared_preferences_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_routes.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/services/firebase_options.dart';
import 'package:zero_hunger/features/widgets/tabBar/tab_bar_widgets.dart';
import 'package:zero_hunger/view/auth/login/view/login_view.dart';
import 'package:zero_hunger/view/auth/onboard/view/onboard_view.dart';

int? isViewed;

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt(SharedKeys.onboard.name);

  await Firebase.initializeApp(
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
      title: ProjectTextUtility.textApp,
      theme: ThemeData(
        bottomAppBarTheme: const BottomAppBarTheme(
          height: ProjectFontSizeUtility.tabBarHeight,
          color: ProjectColorsUtility.projectBackgroundWhite,
          shape: CircularNotchedRectangle(),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ProjectColorsUtility.eveningStar,
        ),
      ),
      home: isViewed != 0 ? const OnBoardView() : const LoginView(),
      initialRoute: isViewed != 0 ? NavigateRoutes.onboard.withParaph : NavigateRoutes.login.withParaph,
      routes: NavigatorRoutes().items,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
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
        resizeToAvoidBottomInset: false,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_outlined),
          onPressed: () async {
            await NavigatorManager.instance.pushNamedToPage(route: NavigateRoutes.addAdvert.withParaph);
          },
        ),
        bottomNavigationBar: SafeArea(
          child: BottomAppBar(
            notchMargin: _notchedValue,
            child: shationTabView(tabController: _tabController),
          ),
        ),
        body: shationTabBarView(tabController: _tabController),
      ),
    );
  }
}
