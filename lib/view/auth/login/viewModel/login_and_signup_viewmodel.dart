import 'package:mobx/mobx.dart';
part 'login_and_signup_viewmodel.g.dart';

class LoginAndSignUpViewModel = _LoginAndSignUpViewModelBase with _$LoginAndSignUpViewModel;

abstract class _LoginAndSignUpViewModelBase with Store {
  @observable
  bool isSecure = true;

  @action
  void changeSecureIcon() {
    isSecure = !isSecure;
  }
}
