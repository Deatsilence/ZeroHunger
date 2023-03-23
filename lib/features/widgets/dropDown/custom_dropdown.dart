import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/viewModel/advert_view_model.dart';
import 'package:zero_hunger/features/widgets/dropDown/expended_section.dart';
import 'package:zero_hunger/features/widgets/dropDown/scroll_bar.dart';

class CustomDropwdown extends StatefulWidget {
  const CustomDropwdown({super.key});

  @override
  State<CustomDropwdown> createState() => _CustomDropwdownState();
}

class _CustomDropwdownState extends State<CustomDropwdown> {
  final AdvertViewModel avm = AdvertViewModel();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(
                color: ProjectColorsUtility.eveningStar,
                width: 0,
              ),
              borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: ProjectColorsUtility.eveningStar,
                    ),
                    borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 45,
                    minWidth: double.infinity,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Observer(builder: (_) {
                      return Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Category",
                                style: TextThemeUtility()
                                    .textThemeLogin(context: context, fontSize: ProjectFontSizeUtility.small),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => avm.changeIsStrechedDropwDown(),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(
                                avm.isStrechedDropwDown ? Icons.arrow_upward_outlined : Icons.arrow_downward_outlined,
                              ),
                            ),
                          ),
                          ExpandedSection(
                            expand: avm.isStrechedDropwDown,
                            height: 300,
                            child: MyScrollbar(
                              builder: (context, scrollController) => ListView.builder(
                                itemCount: 4,
                                itemBuilder: (BuildContext context, int index) {
                                  return const Text("data");
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
