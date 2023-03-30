// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/border_radius_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/viewModel/advert_view_model.dart';

class CustomDropwdown extends StatefulWidget {
  const CustomDropwdown({
    Key? key,
    required this.onChanged,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  final Function onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  State<CustomDropwdown> createState() => _CustomDropwdownState();
}

class _CustomDropwdownState extends State<CustomDropwdown> {
  final AdvertViewModel avm = AdvertViewModel();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: ProjectBorderRadiusUtility().normalBorderRadius,
            border: Border.all(
              color: ProjectColorsUtility.eveningStar,
              width: 2,
            ),
          ),
          child: Center(
            child: DropdownButtonFormField<String>(
              onSaved: widget.onSaved,
              validator: widget.validator,
              hint: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  ProjectTextUtility.textCategory,
                  style: TextThemeUtility().textThemeLogin(
                      context: context,
                      fontSize: ProjectFontSizeUtility.small,
                      color: ProjectColorsUtility.eveningStar),
                ),
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              icon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_downward_outlined,
                  color: ProjectColorsUtility.onboardBlack,
                ),
              ),
              isExpanded: true,
              value: avm.value,
              items: avm.items.map<DropdownMenuItem<String>>(buildMenuItem).toList(),
              onChanged: (value) {
                widget.onChanged(value);
              },
            ),
          ),
        );
      },
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem<String>(
        value: item,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            item,
            style: TextThemeUtility().textThemeLogin(
                context: context, fontSize: ProjectFontSizeUtility.small, color: ProjectColorsUtility.eveningStar),
          ),
        ),
      );
}
