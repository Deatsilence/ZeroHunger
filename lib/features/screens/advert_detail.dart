import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/viewModel/advert_detail_view_model.dart';
import 'package:zero_hunger/features/widgets/button/custom_elevated_button.dart';

class AdvertDetail extends StatefulWidget {
  const AdvertDetail({super.key});

  @override
  State<AdvertDetail> createState() => _AdvertDetailState();
}

class _AdvertDetailState extends State<AdvertDetail> {
  final AdvertDetailViewModel advm = AdvertDetailViewModel();

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    advm.getUsernameFromFirebase(arg[ProjectTextUtility.textUserIdOfItemStorage]);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.40,
              child: FadeInImage.memoryNetwork(
                fit: BoxFit.cover,
                placeholder: kTransparentImage,
                image: arg[ProjectTextUtility.textPhotoUrlsOfItemStorage][0],
              ),
            ),
            buttonArrow(context),
            scroll(context, arg),
          ],
        ),
      ),
    );
  }

  Padding buttonArrow(BuildContext context) {
    return Padding(
      padding: ProjectPaddingUtility().normalAllPadding,
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_outlined,
                size: 20,
                color: ProjectColorsUtility.projectBackgroundWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }

  DraggableScrollableSheet scroll(BuildContext context, Map<dynamic, dynamic> arg) {
    var initialChildSize = 0.6;
    var maxChildSize = 1.0;
    var minChildSize = 0.6;
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      maxChildSize: maxChildSize,
      minChildSize: minChildSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: ProjectPaddingUtility().normalAllPadding,
          decoration: BoxDecoration(
            color: ProjectColorsUtility.projectBackgroundWhite,
            borderRadius: BorderRadius.only(
              topLeft: ProjectRadiusUtility().DraggableScrollableSheetRadiusCircular,
              topRight: ProjectRadiusUtility().DraggableScrollableSheetRadiusCircular,
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: ProjectPaddingUtility().draggableScrollIconOnlyPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 40,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
                Text(
                  arg[ProjectTextUtility.textTitleOfItemStorage],
                  style: TextThemeUtility().textThemeOnboard(
                    context: context,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  arg[ProjectTextUtility.textCreatedAtOfItemStorage],
                  style: TextThemeUtility().textThemeOnboard(
                    context: context,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/profile/png/Blank-Avatar.png"),
                    ),
                    Padding(
                      padding: ProjectPaddingUtility().advertDetailProfileNameOnlyPadding,
                      child: Observer(builder: (_) {
                        return Text(
                          advm.username,
                          style: TextThemeUtility().textThemeOnboard(
                            context: context,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                Padding(
                  padding: ProjectPaddingUtility().dividerVerticalPadding,
                  child: const Divider(
                    thickness: 2,
                    height: 4,
                  ),
                ),
                Text(
                  "Description",
                  style: TextThemeUtility().textThemeOnboard(
                    context: context,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  arg[ProjectTextUtility.textDescriptionOfItemStorage],
                  style: TextThemeUtility().textThemeOnboard(
                    context: context,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: ProjectPaddingUtility().dividerVerticalPadding,
                  child: const Divider(
                    thickness: 2,
                    height: 4,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: customElevatedButton(
                    text: "Chat",
                    context: context,
                    onPressed: () {},
                    icon: Icons.chat_outlined,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
