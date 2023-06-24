// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = "",
    this.leading,
    this.titleWidget,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ProjectColorsUtility.grey,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Padding(
          padding: ProjectPaddingUtility().appBarHorizontalAndVerticalPadding,
          child: Stack(
            children: [
              if (leading != null)
                Positioned(
                  top: 0,
                  left: 0,
                  child: leading ?? const SizedBox.shrink(),
                ),
              Positioned.fill(
                child: titleWidget == null
                    ? Center(
                        child: Text(
                          title,
                          style: TextThemeUtility().textThemeLogin(
                            context: context,
                            fontSize: ProjectFontSizeUtility.normal,
                          ),
                        ),
                      )
                    : Center(
                        child: titleWidget,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        ProjectFontSizeUtility.appBarHeight,
      );
}
