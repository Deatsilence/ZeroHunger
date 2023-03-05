import 'package:flutter/material.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/widgets/button/custom_elevated_button.dart';
import 'package:zero_hunger/features/widgets/textFormField/custom_text_form_field.dart';
import 'package:zero_hunger/view/auth/login/view/login_and_signup_scaffold.dart';

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

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      isLogin: false,
      usernameTextController: _usernameTextController,
      emailTextController: _emailTextController,
      passwordTextController: _passwordTextController,
      confirmTextController: _confirmPasswordTextController,
      pageFields: signUpPageFields(
        context,
        usernameController: _usernameTextController,
        emailController: _emailTextController,
        passwordController: _passwordTextController,
        confirmPasswordController: _confirmPasswordTextController,
      ),
    );
  }
}

List<Widget> signUpPageFields(
  BuildContext context, {
  required TextEditingController usernameController,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController confirmPasswordController,
}) {
  return [
    CustomTextFormField(
      text: ProjectTextUtility.textUsername,
      textInputAction: TextInputAction.next,
      icon: Icons.person_outline_outlined,
      controller: usernameController,
      context: context,
    ),
    CustomTextFormField(
      text: ProjectTextUtility.textEmail,
      textInputAction: TextInputAction.next,
      icon: Icons.mail_outlined,
      controller: emailController,
      context: context,
    ),
    CustomTextFormField(
      text: ProjectTextUtility.textPassword,
      textInputAction: TextInputAction.next,
      isActiveSuffixIcon: true,
      isPasswordType: true,
      icon: Icons.lock_outlined,
      controller: passwordController,
      context: context,
    ),
    CustomTextFormField(
      text: ProjectTextUtility.textConfirmPassword,
      textInputAction: TextInputAction.done,
      isActiveSuffixIcon: true,
      isPasswordType: true,
      icon: Icons.lock_outlined,
      controller: confirmPasswordController,
      context: context,
    ),
    customElevatedButton(
      context: context,
      text: ProjectTextUtility.textSignUp,
      onPressed: () {},
    ),
  ];
}
