import 'package:flutter/material.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/font_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/padding_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/path_manager.dart';
import 'package:zero_hunger/features/init/theme/utility/theme_manager.dart';
import 'package:zero_hunger/features/widgets/button/custom_elevated_button.dart';
import 'package:zero_hunger/features/widgets/textFormField/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColorsUtility.eveningStar,
      body: SingleChildScrollView(
        child: Padding(
          padding: ProjectAuthenticationPaddingUtility().normalHorizontalAndVerticalPadding,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(LoginImagesPaths.shation.path),
                      Text(
                        isLogin ? ProjectTextUtility.textSignIn : ProjectTextUtility.textSignUp,
                        style: TextThemeUtility().textThemeLogin(
                            context: context,
                            fontSize: ProjectFontSizeUtility.normal,
                            color: ProjectColorsUtility.projectBackgroundWhite),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customTextFormField(
                        text: ProjectTextUtility.textEmail,
                        icon: Icons.mail_outlined,
                        controller: _emailTextController,
                        context: context,
                      ),
                      customTextFormField(
                          text: ProjectTextUtility.textPassword,
                          textInputAction: TextInputAction.done,
                          isPasswordType: true,
                          icon: Icons.lock_outlined,
                          controller: _passwordTextController,
                          context: context),
                      customElevatedButton(
                        context: context,
                        onPressed: () {},
                        icon: Icons.arrow_forward_outlined,
                      ),
                    ],
                  ),
                ),
                Expanded(
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
                        child: Text(
                          ProjectTextUtility.textSignUp,
                          style: TextThemeUtility().textThemeLogin(
                            context: context,
                            fontSize: ProjectFontSizeUtility.small,
                            fontWeight: FontWeight.bold,
                            color: ProjectColorsUtility.projectBackgroundWhite,
                          ),
                        ),
                        // onTap: () => ,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
