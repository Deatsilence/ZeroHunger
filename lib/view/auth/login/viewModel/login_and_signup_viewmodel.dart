import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:zero_hunger/features/init/theme/utility/color_manager.dart';
import 'package:zero_hunger/features/model/user_model.dart' as user_model;
import 'package:zero_hunger/features/services/firestore_service.dart';
import 'package:zero_hunger/view/auth/login/service/auth_service.dart';

part 'login_and_signup_viewmodel.g.dart';

class LoginAndSignUpViewModel = _LoginAndSignUpViewModelBase with _$LoginAndSignUpViewModel;

abstract class _LoginAndSignUpViewModelBase with Store, FirebaseAuthManagerMixin, FirebaseStoreManagerMixin {
  @observable
  bool isSecure = true;

  @observable
  bool isLoading = false;

  @observable
  bool isLogin = true;

  @observable
  Color suffixColor = ProjectColorsUtility.grey;

  @action
  void changeColorOfSuffix(String value) {
    if (value.isNotEmpty) {
      suffixColor = ProjectColorsUtility.eveningStar;
    } else {
      suffixColor = ProjectColorsUtility.grey;
    }
  }

  @action
  void changeSecureIcon() {
    isSecure = !isSecure;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void changeLogin() {
    isLogin = !isLogin;
  }

  Future<user_model.User> getUser() async {
    changeLoading();
    final currentUser = getCurrentUser();
    late user_model.User user;
    if (currentUser != null) {
      user = user_model.User.fromJson(await getUserFirestore(currentUser.uid));
    }
    changeLoading();
    return user;
  }
}
