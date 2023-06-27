// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/viewModel/dashboard_view_model.dart';
import 'package:zero_hunger/features/widgets/outline_input_border.dart';
import 'package:zero_hunger/view/auth/login/viewModel/login_and_signup_viewmodel.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.context,
    required this.text,
    required this.controller,
    required this.isPasswordType,
    required this.textinputType,
    this.icon,
    this.onChangedCustom,
    this.borderColor = ProjectColorsUtility.projectBackgroundWhite,
    this.focusedBorderColor = ProjectColorsUtility.eveningStar,
    this.suffixIcon,
    this.isActiveSuffixIcon = false,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onSaved,
    this.maxLine = 1,
    this.minLine = 1,
  }) : super(key: key);

  final BuildContext context;
  final String text;
  final Color borderColor;
  final Color focusedBorderColor;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final bool isActiveSuffixIcon;
  final bool isPasswordType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChangedCustom;
  final int? maxLine;
  final int? minLine;
  final TextInputType textinputType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final LoginAndSignUpViewModel lsvm = LoginAndSignUpViewModel();
  final DashboardViewModel dbv = DashboardViewModel();

  Widget _onVisibilityIcon() {
    return IconButton(
      onPressed: lsvm.changeSecureIcon,
      icon: Observer(
        builder: (_) {
          return AnimatedCrossFade(
            firstChild: const Icon(
              Icons.visibility_off_outlined,
              color: ProjectColorsUtility.eveningStar,
            ),
            secondChild: const Icon(
              Icons.visibility_outlined,
              color: ProjectColorsUtility.eveningStar,
            ),
            crossFadeState: lsvm.isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(seconds: 1),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return TextFormField(
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          onChanged: (value) {
            if (widget.isPasswordType == false) {
              lsvm.changeColorOfSuffix(value);
            }
          },
          minLines: widget.minLine,
          maxLines: widget.maxLine,
          onSaved: widget.onSaved,
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.isPasswordType ? lsvm.isSecure : false,
          enableSuggestions: !widget.isPasswordType,
          autocorrect: false, // !widget.isPasswordType,
          autofillHints: const [AutofillHints.email],
          cursorColor: ProjectColorsUtility.eveningStar,
          cursorWidth: ProjectFontSizeUtility.textFieldCursorWidth,
          cursorHeight: ProjectFontSizeUtility.normal,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ProjectColorsUtility.eveningStar),
          keyboardType: widget.isPasswordType ? TextInputType.visiblePassword : widget.textinputType,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            labelText: widget.text,
            labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ProjectColorsUtility.eveningStar),
            fillColor: ProjectColorsUtility.projectBackgroundWhite,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: CustomOutlineInputBorder(
              borderColor: widget.borderColor,
              borderWidth: 2,
            ).outlineInputBorder,
            focusedBorder: CustomOutlineInputBorder(
              borderColor: widget.focusedBorderColor,
              borderWidth: 2,
            ).outlineInputBorder,
            enabledBorder: CustomOutlineInputBorder(
              borderColor: widget.borderColor,
              borderWidth: 2,
            ).outlineInputBorder,
            disabledBorder: CustomOutlineInputBorder(
              borderColor: widget.borderColor,
              borderWidth: 2,
            ).outlineInputBorder,
            prefixIcon: widget.icon != null
                ? Icon(
                    widget.icon,
                    color: ProjectColorsUtility.eveningStar,
                  )
                : null,
            suffixIcon: widget.isActiveSuffixIcon
                ? _onVisibilityIcon()
                : IconButton(
                    onPressed: () {
                      if (widget.controller.text.isNotEmpty) {
                        widget.controller.clear();
                        lsvm.changeColorOfSuffix(widget.controller.text);
                      }
                    },
                    icon: Icon(widget.suffixIcon),
                    color: lsvm.suffixColor,
                  ),
          ),
        );
      },
    );
  }
}
