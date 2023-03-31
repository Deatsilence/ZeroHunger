import 'package:flutter/material.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_routes.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/lottie_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/viewModel/dashboard_view_model.dart';
import 'package:zero_hunger/features/widgets/appBar/view/custom_app_bar.dart';
import 'package:zero_hunger/features/widgets/button/category_button.dart';
import 'package:zero_hunger/features/widgets/card/item_card.dart';
import 'package:zero_hunger/features/widgets/textFormField/custom_text_form_field.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final int _crossAxisCount = 2;
  final double _childAspectRatio = 0.7;

  DashboardViewModel dbv = DashboardViewModel();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthOfDevice = MediaQuery.of(context).size.width;
    final double heightOfDevice = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: CustomTextFormField(
          borderColor: ProjectColorsUtility.grey,
          text: ProjectTextUtility.textFoodDessertAndMore,
          context: context,
          icon: Icons.search_outlined,
          controller: _searchController,
          isPasswordType: false,
          textinputType: TextInputType.text,
          suffixIcon: Icons.clear_outlined,
          textInputAction: TextInputAction.search,
        ),
      ),
      body: SizedBox(
        width: widthOfDevice,
        height: heightOfDevice,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: ProjectPaddingUtility().categoryButtonsOnlyTopPadding,
              child: _categories(context),
            ),
            const Divider(),
            Expanded(
              child: StreamBuilder(
                stream: dbv.streamOfItems(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return !snapshot.hasData
                      ? ProjectLottieUtility().lottieLoading
                      : Padding(
                          padding: ProjectPaddingUtility().scrollBarOnlyRigthPadding,
                          child: RawScrollbar(
                            thickness: 3,
                            controller: _scrollController,
                            thumbVisibility: true,
                            thumbColor: ProjectColorsUtility.eveningStar,
                            radius: ProjectRadiusUtility().scrollBarRadiusCircular,
                            child: Padding(
                              padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
                              child: GridView.builder(
                                shrinkWrap: true,
                                controller: _scrollController,
                                itemCount: snapshot.data.docs.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: _crossAxisCount,
                                  childAspectRatio: _childAspectRatio,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  var title = snapshot.data!.docs[index].get(ProjectTextUtility.textTitleOfItemStorage);
                                  var description =
                                      snapshot.data!.docs[index].get(ProjectTextUtility.textDescriptionOfItemStorage);
                                  var urlOfPhotos =
                                      snapshot.data!.docs[index].get(ProjectTextUtility.textPhotoUrlsOfItemStorage);
                                  var userId =
                                      snapshot.data!.docs[index].get(ProjectTextUtility.textUserIdOfItemStorage);
                                  var createdAt =
                                      snapshot.data!.docs[index].get(ProjectTextUtility.textCreatedAtOfItemStorage);

                                  var argumentMap = <String, dynamic>{};

                                  addValueToMap(argumentMap, ProjectTextUtility.textTitleOfItemStorage, title);
                                  addValueToMap(
                                      argumentMap, ProjectTextUtility.textDescriptionOfItemStorage, description);
                                  addValueToMap(
                                      argumentMap, ProjectTextUtility.textPhotoUrlsOfItemStorage, urlOfPhotos);
                                  addValueToMap(argumentMap, ProjectTextUtility.textUserIdOfItemStorage, userId);
                                  addValueToMap(argumentMap, ProjectTextUtility.textCreatedAtOfItemStorage, createdAt);

                                  return (index >= 0 && index < snapshot.data!.docs.length)
                                      ? ItemCard(
                                          title: title,
                                          description: description,
                                          urlOfPhoto: urlOfPhotos[0],
                                          location: "loc",
                                          onTab: () async {
                                            await NavigatorManager.instance.pushNamedToPage(
                                              route: NavigateRoutes.advertDetail.withParaph,
                                              arguments: argumentMap,
                                            );
                                          },
                                        )
                                      : const SizedBox.shrink();
                                },
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addValueToMap<K, V>(Map<K, V> map, K key, V value) => map.update(
        key,
        (value) => value,
        ifAbsent: () => value,
      );

  SingleChildScrollView _categories(BuildContext context) {
    final double widthOfDevice = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton(
            onTab: () {},
            text: ProjectTextUtility.textFood,
            backgroundColor: ProjectColorsUtility.eveningStar,
            icon: Icons.food_bank_outlined,
          ),
          SizedBox(width: widthOfDevice * 0.08),
          CategoryButton(
            onTab: () {},
            text: ProjectTextUtility.textDrink,
            backgroundColor: ProjectColorsUtility.peterPan,
            icon: Icons.local_drink_outlined,
          ),
          SizedBox(width: widthOfDevice * 0.08),
          CategoryButton(
            onTab: () {},
            text: ProjectTextUtility.textSweet,
            backgroundColor: ProjectColorsUtility.grey,
            icon: Icons.cake_outlined,
          ),
          SizedBox(width: widthOfDevice * 0.08),
          CategoryButton(
            onTab: () {},
            text: ProjectTextUtility.textSncak,
            backgroundColor: ProjectColorsUtility.denim,
            icon: Icons.home,
          ),
        ],
      ),
    );
  }
}
