import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/widgets/button/custom_elevated_button.dart';
import 'package:zero_hunger/features/widgets/textFormField/custom_text_form_field.dart';
import 'package:zero_hunger/view/auth/login/view/login_and_signup_scaffold.dart';
import 'package:zero_hunger/view/auth/login/viewModel/login_and_signup_viewmodel.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController = TextEditingController();

  LoginAndSignUpViewModel lsvm = LoginAndSignUpViewModel();

  @override
  void dispose() {
    _usernameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AuthScaffold(
        isLogin: lsvm.isLoading,
        usernameTextController: _usernameTextController,
        emailTextController: _emailTextController,
        passwordTextController: _passwordTextController,
        confirmTextController: _confirmPasswordTextController,
      );
    });
  }
}

List<Widget> signUpPageFields(
  BuildContext context, {
  required TextEditingController usernameController,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController confirmPasswordController,
  String? Function(String?)? usernameValidator,
  String? Function(String?)? emailValidator,
  String? Function(String?)? passwordValidator,
  String? Function(String?)? confirmPasswordValidator,
  VoidCallback? onpressed,
  void Function(String?)? onSavedUsername,
  void Function(String?)? onSavedEmail,
  void Function(String?)? onSavedPassword,
  void Function(String?)? onSavedConfirmPassword,
}) {
  return [
    CustomTextFormField(
      text: ProjectTextUtility.textUsername,
      icon: Icons.person_outline_outlined,
      controller: usernameController,
      context: context,
      validator: usernameValidator,
      onSaved: onSavedUsername,
      isPasswordType: false,
      textinputType: TextInputType.text,
      suffixIcon: Icons.close_outlined,
    ),
    CustomTextFormField(
      text: ProjectTextUtility.textEmail,
      icon: Icons.mail_outlined,
      controller: emailController,
      context: context,
      validator: emailValidator,
      onSaved: onSavedEmail,
      isPasswordType: false,
      textinputType: TextInputType.emailAddress,
      suffixIcon: Icons.close_outlined,
    ),
    CustomTextFormField(
      text: ProjectTextUtility.textPassword,
      isActiveSuffixIcon: true,
      isPasswordType: true,
      icon: Icons.lock_outlined,
      controller: passwordController,
      context: context,
      validator: passwordValidator,
      onSaved: onSavedPassword,
      textinputType: TextInputType.visiblePassword,
    ),
    CustomTextFormField(
      text: ProjectTextUtility.textConfirmPassword,
      textInputAction: TextInputAction.done,
      isActiveSuffixIcon: true,
      isPasswordType: true,
      icon: Icons.lock_outlined,
      controller: confirmPasswordController,
      context: context,
      validator: confirmPasswordValidator,
      onSaved: onSavedConfirmPassword,
      textinputType: TextInputType.visiblePassword,
    ),
    CustomElevatedButton(
      context: context,
      text: ProjectTextUtility.textSignUp,
      onPressed: onpressed,
    ),
  ];
}
