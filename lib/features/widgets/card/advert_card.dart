import 'package:flutter/material.dart';
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
  }) : super(key: key);

  final String advertDate;
  final String pathOfAdvertImage;
  final String description;

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
            onPressed: () {},
            icon: const Icon(Icons.menu_outlined),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: ClipRRect(
              borderRadius: ProjectBorderRadiusUtility().buttonBorderRadius,
              child: Image.network(pathOfAdvertImage),
            ),
          ),
          const SizedBox(width: 5),
          Text(description),
        ],
      ),
    ];
  }
}
