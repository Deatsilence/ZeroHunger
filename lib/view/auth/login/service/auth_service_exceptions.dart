import 'package:firebase_auth/firebase_auth.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';

mixin FirebaseServiceException {
  Future<List<dynamic>> tryCatchAuth(Future<UserCredential> func) async {
    String res = ProjectTextUtility.textFirebaseSuccess;
    UserCredential? userResponse;
    try {
      userResponse = await func;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case ProjectTextUtility.textFirebaseUserNotFound:
          res = "User not found";
          return [res, userResponse?.user?.uid];
        case ProjectTextUtility.textFirebaseWrongPassword:
          res = "Wrong password";
          return [res, userResponse?.user?.uid];
        case ProjectTextUtility.textFirebaseUserDisabled:
          res = "User disabled";
          return [res, userResponse?.user?.uid];
        case ProjectTextUtility.textFirebaseEmailAlreadyInUse:
          res = "Email already in use";
          return [res, userResponse?.user?.uid];
        case ProjectTextUtility.textFirebaseInvalidEmail:
          res = "Invalid email";
          return [res, userResponse?.user?.uid];
        case ProjectTextUtility.textFirebaseOperationNotAllowed:
          res = "Operation invalid";
          return [res, userResponse?.user?.uid];
        case ProjectTextUtility.textFirebaseWeakPassword:
          res = "Weak password";
          return [res, userResponse?.user?.uid];
        case ProjectTextUtility.textFirebaseAccountExistsWithDifferentCredential:
          res = "Account exists with different credential";
          return [res, userResponse?.user?.uid];
        case ProjectTextUtility.textFirebaseInvalidCredential:
          res = "Invalid credential";
          return [res, userResponse?.user?.uid];
        case ProjectTextUtility.textFirebaseInvalidVerificationCode:
          res = "Invalid verification code";
          return [res, userResponse?.user?.uid];
        case ProjectTextUtility.textFirebaseInvalidVerificationId:
          res = "Invalid verification id";
          return [res, userResponse?.user?.uid];
        default:
          return [res, userResponse?.user?.uid];
      }
    }
    return [res, userResponse.user?.uid];
  }
}
