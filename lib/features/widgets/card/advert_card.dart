// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';

class CustomAdvertCard extends StatelessWidget {
  const CustomAdvertCard({
    Key? key,
    required this.advertDate,
    required this.pathOfAdvertImage,
    required this.description,
    this.onpressed,
  }) : super(key: key);

  final String advertDate;
  final String pathOfAdvertImage;
  final String description;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: ProjectColorsUtility.grey,
          ),
          borderRadius: ProjectBorderRadiusUtility().buttonBorderRadius,
        ),
        color: ProjectColorsUtility.projectBackgroundWhite,
        child: Padding(
          padding: ProjectPaddingUtility().normalHorizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _contentOfCard(context),
          ),
        ),
      ),
    );
  }

  List<Widget> _contentOfCard(BuildContext context) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            advertDate,
            style: TextThemeUtility().textThemeLogin(
              context: context,
              fontSize: ProjectFontSizeUtility.small,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: onpressed,
            icon: const Icon(Icons.menu_outlined),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.1,
            child: ClipRRect(
              borderRadius: ProjectBorderRadiusUtility().buttonBorderRadius,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: pathOfAdvertImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 5),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 220, maxHeight: 50),
            child: Text(description),
          ),
        ],
      ),
    ];
  }
}
