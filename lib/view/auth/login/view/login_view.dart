import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/widgets/button/custom_elevated_button.dart';
import 'package:zero_hunger/features/widgets/textFormField/custom_text_form_field.dart';
import 'package:zero_hunger/view/auth/login/view/login_and_signup_scaffold.dart';
import 'package:zero_hunger/view/auth/login/viewModel/login_and_signup_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  LoginAndSignUpViewModel lsvm = LoginAndSignUpViewModel();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AuthScaffold(
        isLogin: lsvm.isLogin,
        emailTextController: _emailTextController,
        passwordTextController: _passwordTextController,
      );
    });
  }
}

List<Widget> loginPageFields(
  BuildContext context, {
  required TextEditingController emailController,
  required TextEditingController passwordController,
  String? Function(String?)? emailValidator,
  String? Function(String?)? passwordValidator,
  VoidCallback? onpressed,
  void Function(String?)? onSavedEmail,
  void Function(String?)? onSavedPassword,
}) {
  return [
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
      icon: Icons.lock_outlined,
      controller: passwordController,
      textInputAction: TextInputAction.done,
      context: context,
      validator: passwordValidator,
      onSaved: onSavedPassword,
      isActiveSuffixIcon: true,
      isPasswordType: true,
      textinputType: TextInputType.visiblePassword,
    ),
    customElevatedButton(
      context: context,
      text: ProjectTextUtility.textSignIn,
      onPressed: onpressed,
    )
  ];
}
