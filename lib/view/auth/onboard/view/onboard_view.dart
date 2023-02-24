import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/view/auth/onboard/model/onboard_model.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColorsUtility.projectBackgroundWhite,
      appBar: AppBar(
        backgroundColor: ProjectColorsUtility.projectBackgroundWhite,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Skip"),
          ),
        ],
      ),
      body: Padding(
        padding: ProjectPaddingUtility().normalHorizontalPadding,
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: screens.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.asset(screens[index].img),
                SizedBox(
                  height: _CustomSizeUtility.smallHeight,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: screens.length,
                    itemBuilder: (_, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: _CustomPaddingUtility().smallHorizontalPadding,
                            width: _CustomSizeUtility.smallHeight,
                            height: _CustomSizeUtility.smallHeight,
                            decoration: BoxDecoration(
                              color: ProjectColorsUtility.eveningStar,
                              borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CustomSizeUtility {
  static const double smallHeight = 10.0;
  static const double normalHeight = 20.0;
  static const double bigHeight = 30.0;

  static const double smallWidth = 10.0;
  static const double normalWidth = 20.0;
  static const double bigWidtth = 30.0;
}

class _CustomPaddingUtility {
  final EdgeInsets smallHorizontalPadding = const EdgeInsets.symmetric(horizontal: 3);
}
