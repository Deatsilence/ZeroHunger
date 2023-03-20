import 'package:mobx/mobx.dart';
part 'login_and_signup_viewmodel.g.dart';

class LoginAndSignUpViewModel = _LoginAndSignUpViewModelBase with _$LoginAndSignUpViewModel;

abstract class _LoginAndSignUpViewModelBase with Store {
  @observable
  bool isSecure = true;

  @observable
  bool isLoading = false;

  @observable
  bool isLogin = true;

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

  
}
