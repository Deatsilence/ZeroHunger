import 'package:flutter/material.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_manager.dart';
import 'package:zero_hunger/features/init/navigator/navigator_routes.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/lottie_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/path_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/mixin/validator_mixin.dart';
import 'package:zero_hunger/features/model/user_model.dart' as user_model;
import 'package:zero_hunger/features/services/firestore_service.dart';
import 'package:zero_hunger/features/viewModel/profile_view_model.dart';
import 'package:zero_hunger/features/widgets/alertDialog/custom_alert_dialog.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service_exceptions.dart';
import 'package:zero_hunger/view/auth/login/view/signup_view.dart';
import 'package:zero_hunger/view/auth/login/view/login_view.dart';
import 'package:zero_hunger/view/auth/login/viewModel/login_and_signup_viewmodel.dart';

class AuthScaffold extends StatelessWidget
    with ValidatorMixin, FirebaseAuthManagerMixin, FirebaseStoreManagerMixin, FirebaseServiceException {
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

  final LoginAndSignUpViewModel lsvm = LoginAndSignUpViewModel();
  final UserViewModel uvm = UserViewModel();

  late String? _username;
  late String? _email;
  late String? _password;
  late String? _confirmPassword;

  String? _usernameValidator(String? username) {
    if (isValidUsername(username ?? "")) {
      _username = username;
      return null;
    } else {
      return ProjectTextUtility.textUsernameValidate;
    }
  }

  String? _emailValidator(String? email) {
    if (isValidEmail(email ?? "")) {
      _email = email;
      return null;
    } else {
      return ProjectTextUtility.textEmailValidate;
    }
  }

  String? _passwordValidator(String? password) {
    if (isValidPassword(password ?? "")) {
      _password = password;
      return null;
    } else {
      return ProjectTextUtility.textPasswordValidate;
    }
  }

  String? _confirmPasswordValidator(String? confirmPassword) {
    if (_password == confirmPassword) {
      return null;
    } else {
      return ProjectTextUtility.textConfirmPasswordValidate;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> signUpControl() async {
      if (formGlobalKey.currentState != null) {
        if (formGlobalKey.currentState!.validate()) {
          formGlobalKey.currentState!.save();

          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => ProjectLottieUtility().lottieLoading,
          );

          var response = await tryCatchAuth(signUp(email: _email!.trim(), password: _password!.trim())).whenComplete(
            () => Navigator.of(context).pop(),
          );

          if (response.first == ProjectTextUtility.textFirebaseSuccess) {
            formGlobalKey.currentState!.reset();

            final user = user_model.User(
              id: response[1],
              name: _username,
              email: _email,
              password: _password,
            );

            await signUpFirestore(user);
            await NavigatorManager.instance.pushToReplacementNamedPage(route: NavigateRoutes.login.withParaph);
          } else {
            if (context.mounted) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: ProjectTextUtility.textWarning,
                  textError: response.first,
                ),
              );
            }
          }
        }
      }
    }

    Future<void> signInControl() async {
      if (formGlobalKey.currentState != null) {
        if (formGlobalKey.currentState!.validate()) {
          formGlobalKey.currentState!.save();

          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => ProjectLottieUtility().lottieLoading,
          );

          var response = await tryCatchAuth(signIn(email: _email!.trim(), password: _password!.trim())).whenComplete(
            () => Navigator.of(context).pop(),
          );

          if (response.first == ProjectTextUtility.textFirebaseSuccess) {
            formGlobalKey.currentState!.reset();

            final user_model.User user = await lsvm.getUser();
            await saveUserData(user);

            await NavigatorManager.instance.pushToReplacementNamedPage(route: NavigateRoutes.home.withParaph);
          } else {
            if (context.mounted) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: ProjectTextUtility.textWarning,
                  textError: response.first,
                ),
              );
            }
          }
        }
      }
    }

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
                    child: SizedBox(
                      child: Image.asset(
                        LoginImagesPaths.shation.path,
                        fit: BoxFit.fill,
                      ),
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
                                // passwordValidator: _passwordValidator,
                                onpressed: signInControl,
                                onSavedEmail: (value) {
                                  _email = value;
                                },
                                onSavedPassword: (value) {
                                  _password = value;
                                },
                              )
                            : signUpPageFields(
                                context,
                                usernameController: _usernameTextController ?? TextEditingController(),
                                emailController: _emailTextController,
                                passwordController: _passwordTextController,
                                confirmPasswordController: _confirmTextController ?? TextEditingController(),
                                usernameValidator: _usernameValidator,
                                emailValidator: _emailValidator,
                                passwordValidator: _passwordValidator,
                                confirmPasswordValidator: _confirmPasswordValidator,
                                onpressed: signUpControl,
                                onSavedUsername: (value) {
                                  _username = value;
                                },
                                onSavedEmail: (value) {
                                  _email = value;
                                },
                                onSavedPassword: (value) {
                                  _password = value;
                                },
                                onSavedConfirmPassword: (value) {
                                  _confirmPassword = value;
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
