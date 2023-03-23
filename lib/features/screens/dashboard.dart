import 'package:flutter/material.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
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
  final TextEditingController _textEditingController = TextEditingController();

  final int _crossAxisCount = 2;
  final double _childAspectRatio = 0.7;

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
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
          controller: _textEditingController,
          isPasswordType: false,
          textinputType: TextInputType.text,
        ),
      ),
      body: Padding(
        padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
        child: SizedBox(
          width: widthOfDevice,
          height: heightOfDevice,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _categories(context),
              const Divider(),
              Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: _crossAxisCount,
                  childAspectRatio: _childAspectRatio,
                  children: List.generate(
                    15,
                    (index) => const ItemCard(
                      title: "title",
                      description: "desc",
                      urlOfPhoto: "https://picsum.photos/200",
                      location: "loc",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
