import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:zero_hunger/features/init/cache/shared_preferences_manager.dart';
import 'package:zero_hunger/features/model/user_model.dart' as user_model;
import 'package:zero_hunger/view/auth/login/viewModel/login_and_signup_viewmodel.dart';

mixin FirebaseAuthManagerMixin {
  LoginAndSignUpViewModel get _lsvm => LoginAndSignUpViewModel();
  auth.FirebaseAuth get _instance => auth.FirebaseAuth.instance;

  Future<auth.UserCredential> signUp({required String email, required String password}) async {
    _lsvm.changeLoading();
    var userResult = await _instance.createUserWithEmailAndPassword(email: email, password: password);
    _lsvm.changeLoading();
    return userResult;
  }

  Future<auth.UserCredential> signIn({required String email, required String password}) async {
    var userResult = await _instance.signInWithEmailAndPassword(email: email, password: password);
    return userResult;
  }

  Future<void> logout() async {
    _lsvm.changeLoading();
    await _instance.signOut();
    _lsvm.changeLoading();
  }

  auth.User? getCurrentUser() {
    return _instance.currentUser;
  }

  Future<void> saveUserData(user_model.User? user) async {
    SharedManager().saveUserData(user_model.User(
      id: user?.id,
      name: user?.name,
      email: user?.email,
      photoUrl: user?.photoUrl,
    ));
  }

  Future<bool> checkUserAvailable() async {
    final currentUser = getCurrentUser();

    if (currentUser != null) {
      return true;
    }
    return false;
  }
}
