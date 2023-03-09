import 'package:flutter/material.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_routes.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/path_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/mixin/validator_mixin.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service_exceptions.dart';
import 'package:zero_hunger/view/auth/login/view/signup_view.dart';
import 'package:zero_hunger/view/auth/login/view/login_view.dart';
import 'package:zero_hunger/view/auth/login/viewModel/login_and_signup_viewmodel.dart';

class AuthScaffold extends StatelessWidget with ValidatorMixin, FirebaseAuthManagerMixin, FirebaseServiceException {
  AuthScaffold({
    super.key,
    required this.isLogin,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
    TextEditingController? usernameTextController,
    TextEditingController? confirmTextController,
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

  late LoginAndSignUpViewModel lsvm = LoginAndSignUpViewModel();

  late String? username;
  late String? email;
  late String? password;
  late String? confirmPassword;

  String? _passwordValidator(password) {
    if (isValidPasswordLength(password ?? "")) {
      return null;
    } else {
      return ProjectTextUtility.textPasswordValidate;
    }
  }

  String? _emailValidator(email) {
    if (isValidEmail(email ?? "")) {
      return null;
    } else {
      return ProjectTextUtility.textEmailValidate;
    }
  }

  Future<void> _signUp() async {
    if (formGlobalKey.currentState != null) {
      if (formGlobalKey.currentState!.validate()) {
        formGlobalKey.currentState!.save();

        var response = await tryCatchAuth(signUp(email: email!.trim(), password: password!.trim()));

        if (response == ProjectTextUtility.textFirebaseSuccess) {
          formGlobalKey.currentState!.reset();
          await NavigatorManager.instance.pushToReplacementNamedPage(route: NavigateRoutes.login.withParaph);
        }
      }
    }
  }

  Future<void> _signIn() async {
    if (formGlobalKey.currentState != null) {
      if (formGlobalKey.currentState!.validate()) {
        formGlobalKey.currentState!.save();

        var response = await tryCatchAuth(signIn(email: email!.trim(), password: password!.trim()));

        if (response == ProjectTextUtility.textFirebaseSuccess) {
          formGlobalKey.currentState!.reset();
          await NavigatorManager.instance.pushToReplacementNamedPage(route: NavigateRoutes.dashboard.withParaph);
        }
      }
    }
  }

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
            padding: ProjectPaddingUtility().normalHorizontalAndVerticalPadding,
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
                                emailValidator: _emailValidator,
                                passwordValidator: _passwordValidator,
                                onpressed: _signIn,
                                onSavedEmail: (value) {
                                  email = value;
                                },
                                onSavedPassword: (value) {
                                  password = value;
                                },
                              )
                            : signUpPageFields(
                                context,
                                usernameController: _usernameTextController ?? TextEditingController(),
                                emailController: _emailTextController,
                                passwordController: _passwordTextController,
                                confirmPasswordController: _confirmTextController ?? TextEditingController(),
                                emailValidator: _emailValidator,
                                passwordValidator: _passwordValidator,
                                onpressed: _signUp,
                                onSavedEmail: (value) {
                                  email = value;
                                },
                                onSavedPassword: (value) {
                                  password = value;
                                },
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
                                onTap: () {
                                  lsvm.changeLogin();
                                  NavigatorManager.instance.pushNamedToPage(route: NavigateRoutes.signUp.withParaph);
                                },
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
