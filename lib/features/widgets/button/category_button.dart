// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.onTab,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.16,
            decoration: BoxDecoration(
              borderRadius: ProjectBorderRadiusUtility().categoryBorderRadius,
              color: backgroundColor,
            ),
            child: Icon(
              icon,
              color: ProjectColorsUtility.projectBackgroundWhite,
            ),
          ),
          const SizedBox(height: 10),
          Text(text),
        ],
      ),
    );
  }
}
