// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.title,
    required this.description,
    required this.urlOfPhoto,
    required this.location,
    this.onTab,
  }) : super(key: key);

  final String title;
  final String description;
  final String urlOfPhoto;
  final String location;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Card(
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
      ),
    );
  }

  List<Widget> _itemsOfCard(BuildContext context) {
    return [
      Expanded(
        flex: 6,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          child: ClipRRect(
            borderRadius: ProjectBorderRadiusUtility().buttonBorderRadius,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: urlOfPhoto,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 4,
        child: Padding(
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
              FittedBox(child: Text(location)),
            ],
          ),
        ),
      ),
    ];
  }
}
