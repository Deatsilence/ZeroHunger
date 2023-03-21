import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_routes.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/viewModel/profile_view_model.dart';
import 'package:zero_hunger/features/widgets/appBar/view/custom_app_bar.dart';
import 'package:zero_hunger/features/widgets/listTile/custom_list_tile.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with FirebaseAuthManagerMixin {
  final UserViewModel uvm = UserViewModel();

  @override
  void initState() {
    super.initState();
    uvm.getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: ProjectTextUtility.textMyAccount,
      ),
      body: Padding(
        padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: _profileListView("Mert", "https://picsum.photos/200"),
          ),
        ),
      ),
    );
  }

  List<Widget> _profileListView(String name, String avatarUrl) {
    return [
      const Divider(thickness: 2),
      Row(
        children: [
          CircleAvatar(
            radius: 60,
            child: ClipRRect(
              borderRadius: ProjectBorderRadiusUtility().categoryBorderRadius,
              child: Image.network(avatarUrl),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Observer(builder: (_) {
                return Text(
                  textAlign: TextAlign.center,
                  uvm.username,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: ProjectFontSizeUtility.normal,
                      ),
                );
              }),
              TextButton(
                onPressed: () {},
                child: Text(
                  ProjectTextUtility.textViewAndEditProfile,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: ProjectFontSizeUtility.small,
                        color: ProjectColorsUtility.projectPink,
                      ),
                ),
              )
            ],
          ),
        ],
      ),
      const Divider(thickness: 2),
      CustomListTile(
        onTab: () {},
        title: const Text(ProjectTextUtility.textMyConnections),
        leading: const Icon(Icons.people_alt_rounded),
        trailing: const Icon(Icons.chevron_right_outlined),
      ),
      const Divider(thickness: 2),
      CustomListTile(
        onTab: () {},
        title: const Text(ProjectTextUtility.textOrdersAndBilling),
        leading: const Icon(Icons.settings_outlined),
        trailing: const Icon(Icons.chevron_right_outlined),
      ),
      const Divider(thickness: 2),
      CustomListTile(
        onTab: () {},
        title: const Text(ProjectTextUtility.textSettings),
        leading: const Icon(Icons.info_outlined),
        trailing: const Icon(Icons.chevron_right_outlined),
      ),
      const Divider(thickness: 2),
      CustomListTile(
        onTab: () async => await logout().then(
            (value) => NavigatorManager.instance.pushToReplacementNamedPage(route: NavigateRoutes.login.withParaph)),
        title: const Text(ProjectTextUtility.textLogout),
        leading: const Icon(Icons.logout_outlined),
      ),
      const Divider(thickness: 2),
    ];
  }
}
