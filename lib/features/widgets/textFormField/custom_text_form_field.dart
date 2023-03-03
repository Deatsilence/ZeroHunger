import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/widgets/outline_input_border.dart';

TextFormField customTextFormField({
  required BuildContext context,
  required String text,
  required IconData icon,
  bool isPasswordType = false,
  TextInputAction textInputAction = TextInputAction.next,
  required TextEditingController controller,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: ProjectColorsUtility.eveningStar,
    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ProjectColorsUtility.eveningStar),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      labelText: text,
      labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ProjectColorsUtility.eveningStar),
      fillColor: ProjectColorsUtility.projectBackgroundWhite,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: CustomOutlineInputBorder().outlineInputBorder,
      focusedBorder: CustomOutlineInputBorder().outlineInputBorder,
      enabledBorder: CustomOutlineInputBorder().outlineInputBorder,
      disabledBorder: CustomOutlineInputBorder().outlineInputBorder,
      prefixIcon: Icon(
        icon,
        color: ProjectColorsUtility.eveningStar,
      ),
    ),
  );
}
