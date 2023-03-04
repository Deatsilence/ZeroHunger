import 'package:flutter/material.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/widgets/outline_input_border.dart';
import 'package:zero_hunger/view/auth/login/viewModel/login_and_signup_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Widget customTextFormField({
  required BuildContext context,
  required String text,
  required IconData icon,
  required TextEditingController controller,
  bool isActiveSuffixIcon = false,
  bool isPasswordType = false,
  TextInputAction textInputAction = TextInputAction.next,
}) {
  LoginAndSignUpViewModel lsvm = LoginAndSignUpViewModel();

  bool isSecure() {
    return lsvm.isSecure;
  }

  Widget _onVisibilityIcon() {
    return Observer(builder: (_) {
      return IconButton(
        onPressed: lsvm.changeSecureIcon,
        icon: AnimatedCrossFade(
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
        ),
      );
    });
  }

  return Observer(builder: (_) {
    return TextFormField(
      controller: controller,
      obscureText: lsvm.isSecure,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: ProjectColorsUtility.eveningStar,
      cursorWidth: 2,
      cursorHeight: 20,
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
        suffixIcon: isActiveSuffixIcon ? _onVisibilityIcon() : null,
      ),
    );
  });
}
