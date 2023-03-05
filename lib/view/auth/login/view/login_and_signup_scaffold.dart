import 'package:flutter/material.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/path_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/mixin/validator_mixin.dart';
import 'package:zero_hunger/view/auth/login/view/signup_view.dart';
import 'package:zero_hunger/view/auth/login/view/login_view.dart';

class AuthScaffold extends StatelessWidget with ValidatorMixin {
  AuthScaffold({
    super.key,
    required this.isLogin,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
    TextEditingController? usernameTextController,
    TextEditingController? confirmTextController,
    required List<Widget> pageFields,
  })  : _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        _usernameTextController = usernameTextController,
        _confirmTextController = confirmTextController;

  final bool isLogin;
  final TextEditingController? _usernameTextController;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;
  final TextEditingController? _confirmTextController;

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: isLogin ? false : true,
      appBar: isLogin
          ? null
          : AppBar(
              backgroundColor: ProjectColorsUtility.eveningStar,
              elevation: 0,
              title: const Text(ProjectTextUtility.textSignUp),
            ),
      backgroundColor: ProjectColorsUtility.eveningStar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: ProjectAuthenticationPaddingUtility().normalHorizontalAndVerticalPadding,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: isLogin ? 4 : 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          LoginImagesPaths.shation.path,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: isLogin ? 3 : 5,
                    child: Form(
                      key: formGlobalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: isLogin
                            ? loginPageFields(
                                context,
                                emailController: _emailTextController,
                                passwordController: _passwordTextController,
                                emailValidator: (email) {
                                  if (isValidEmail(email ?? "")) {
                                    return null;
                                  } else {
                                    return "Enter a valid email address";
                                  }
                                },
                                passwordValidator: (password) {
                                  if (isValidPasswordLength(password ?? "")) {
                                    return null;
                                  } else {
                                    return "Length of password should taller than or equal 6";
                                  }
                                },
                                onpressed: () {
                                  if (formGlobalKey.currentState != null) {
                                    if (formGlobalKey.currentState!.validate()) {
                                      formGlobalKey.currentState!.save();
                                    }
                                  }
                                },
                              )
                            : signUpPageFields(
                                context,
                                usernameController: _usernameTextController ?? TextEditingController(),
                                emailController: _emailTextController,
                                passwordController: _passwordTextController,
                                confirmPasswordController: _confirmTextController ?? TextEditingController(),
                              ),
                      ),
                    ),
                  ),
                  isLogin
                      ? Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ProjectTextUtility.textDontHaveAccount,
                                style: TextThemeUtility().textThemeLogin(
                                  context: context,
                                  fontSize: ProjectFontSizeUtility.small,
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    NavigatorManager.instance.pushToPage(context: context, view: const SignUpView()),
                                child: Text(
                                  ProjectTextUtility.textSignUp,
                                  style: TextThemeUtility().textThemeLogin(
                                    context: context,
                                    fontSize: ProjectFontSizeUtility.small,
                                    fontWeight: FontWeight.bold,
                                    color: ProjectColorsUtility.projectBackgroundWhite,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
