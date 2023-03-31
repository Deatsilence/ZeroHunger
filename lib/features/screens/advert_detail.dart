// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
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
  final AdvertDetailViewModel _advm = AdvertDetailViewModel();
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    _advm.getUsernameFromFirebase(arg[ProjectTextUtility.textUserIdOfItemStorage]);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.40,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) => _advm.increaseCurrentIndex(value),
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: arg[ProjectTextUtility.textPhotoUrlsOfItemStorage].length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.40,
                        child: FadeInImage.memoryNetwork(
                          fit: BoxFit.cover,
                          placeholder: kTransparentImage,
                          image: arg[ProjectTextUtility.textPhotoUrlsOfItemStorage][index],
                        ),
                      ),
                      Observer(builder: (_) {
                        return Padding(
                          padding: ProjectPaddingUtility().advertDetailCurrentImagesPageIconsOnlyPadding,
                          child: SizedBox(
                            height: ProjectFontSizeUtility.verySmall,
                            child: _AdvertDetailListViewBuilder(
                              arg: arg,
                              currentIndex: _advm.currentIndex,
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                },
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
                        color: ProjectColorsUtility.draggableScrollableSheetAdvertDetail,
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
                _avatarAndNameOfUser(context),
                Padding(
                  padding: ProjectPaddingUtility().dividerVerticalPadding,
                  child: const Divider(
                    thickness: 2,
                    height: 4,
                  ),
                ),
                Text(
                  ProjectTextUtility.textDescription,
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
                    text: ProjectTextUtility.textChat,
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

  Row _avatarAndNameOfUser(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/profile/png/Blank-Avatar.png"),
        ),
        Padding(
          padding: ProjectPaddingUtility().advertDetailProfileNameOnlyPadding,
          child: Observer(builder: (_) {
            return Text(
              _advm.username,
              style: TextThemeUtility().textThemeOnboard(
                context: context,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _AdvertDetailListViewBuilder extends StatelessWidget {
  const _AdvertDetailListViewBuilder({
    Key? key,
    required this.currentIndex,
    required this.arg,
  }) : super(key: key);

  final int currentIndex;
  final Map<String, dynamic> arg;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: arg[ProjectTextUtility.textPhotoUrlsOfItemStorage].length,
      itemBuilder: (_, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              margin: ProjectPaddingUtility().advertDetailImagesPagesIconOnlyPadding,
              width: currentIndex == index ? OnBoardFontSizeUtility.currentIndexFontSize : ProjectFontSizeUtility.small,
              height: ProjectFontSizeUtility.verySmall,
              decoration: BoxDecoration(
                color: currentIndex == index ? Colors.black : Colors.black12,
                borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3,
                  sigmaY: 3,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
