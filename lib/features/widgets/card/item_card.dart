// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/margin_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.title,
    required this.description,
    required this.urlOfPhoto,
    required this.location,
  }) : super(key: key);

  final String title;
  final String description;
  final String urlOfPhoto;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMarginUtility().normalAllMargin,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 1,
          color: ProjectColorsUtility.grey,
        ),
        borderRadius: ProjectBorderRadiusUtility().buttonBorderRadius,
      ),
      color: ProjectColorsUtility.projectBackgroundWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _itemsOfCard(context),
      ),
    );
  }

  List<Widget> _itemsOfCard(BuildContext context) {
    return [
      ClipRRect(
        borderRadius: ProjectBorderRadiusUtility().buttonBorderRadius,
        child: Image.network(
          urlOfPhoto,
          alignment: Alignment.topCenter,
        ),
      ),
      Padding(
        padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextThemeUtility().textThemeLogin(
                context: context,
                fontSize: ProjectFontSizeUtility.small,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(location),
          ],
        ),
      ),
    ];
  }
}
