import 'package:firebase_auth/firebase_auth.dart';
import 'package:zero_hunger/view/auth/login/viewModel/login_and_signup_viewmodel.dart';

mixin FirebaseAuthManagerMixin {
  LoginAndSignUpViewModel get _lsvm => LoginAndSignUpViewModel();
  FirebaseAuth get instance => FirebaseAuth.instance;

  Future<UserCredential> signUp({required String email, required String password}) async {
    _lsvm.changeLoading();
    var userResult = await instance.createUserWithEmailAndPassword(email: email, password: password);
    _lsvm.changeLoading();
    return userResult;
  }

  Future<UserCredential> signIn({required String email, required String password}) async {
    _lsvm.changeLoading();
    var userResult = await instance.signInWithEmailAndPassword(email: email, password: password);
    _lsvm.changeLoading();
    return userResult;
  }

  Future<void> logout() async {
    _lsvm.changeLoading();
    await instance.signOut();
    _lsvm.changeLoading();
  }
}
