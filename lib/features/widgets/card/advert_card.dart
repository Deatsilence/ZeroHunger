// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/viewModel/advert_view_model.dart';

class CustomAdvertCard extends StatelessWidget {
  CustomAdvertCard({
    Key? key,
    required this.advertDate,
    required this.pathOfAdvertImage,
    required this.description,
    required this.itemId,
    this.onpressed,
  }) : super(key: key);

  final String advertDate;
  final String pathOfAdvertImage;
  final String description;
  final String itemId;
  final VoidCallback? onpressed;

  final AdvertViewModel avm = AdvertViewModel();

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
          Theme(
            data: Theme.of(context).copyWith(cardColor: ProjectColorsUtility.projectBackgroundWhite),
            child: PopupMenuButton(
              position: PopupMenuPosition.under,
              shape: RoundedRectangleBorder(
                borderRadius: ProjectBorderRadiusUtility().buttonBorderRadius,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    ProjectTextUtility.textEdit,
                    style: TextThemeUtility().textThemeLogin(
                      context: context,
                      fontSize: ProjectFontSizeUtility.small,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text(
                    ProjectTextUtility.textDelete,
                    style: TextThemeUtility().textThemeLogin(
                      context: context,
                      fontSize: ProjectFontSizeUtility.small,
                      color: ProjectColorsUtility.projectPink,
                    ),
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 1) {
                  // edit
                } else if (value == 2) {
                  avm.deleteItem(itemId);
                }
              },
            ),
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
