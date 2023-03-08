import 'package:firebase_auth/firebase_auth.dart';
import 'package:zero_hunger/features/constant/texts/text_manager.dart';

mixin FirebaseServiceException {
  Future<String?> tryCatchAuth(Future<UserCredential> func) async {
    String? res;
    try {
      await func;
      res = ProjectTextUtility.textFirebaseSuccess;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case ProjectTextUtility.textFirebaseUserNotFound:
          res = "User not found";
          return res;
        case ProjectTextUtility.textFirebaseWrongPassword:
          res = "Wrong password";
          return res;
        case ProjectTextUtility.textFirebaseUserDisabled:
          res = "User disabled";
          return res;
        case ProjectTextUtility.textFirebaseEmailAlreadyInUse:
          res = "Email already in use";
          return res;
        case ProjectTextUtility.textFirebaseInvalidEmail:
          res = "Invalid email";
          return res;
        case ProjectTextUtility.textFirebaseOperationNotAllowed:
          res = "Operation invalid";
          return res;
        case ProjectTextUtility.textFirebaseWeakPassword:
          res = "Weak password";
          return res;
        case ProjectTextUtility.textFirebaseAccountExistsWithDifferentCredential:
          res = "Account exists with different credential";
          return res;
        case ProjectTextUtility.textFirebaseInvalidCredential:
          res = "Invalid credential";
          return res;
        case ProjectTextUtility.textFirebaseInvalidVerificationCode:
          res = "Invalid verification code";
          return res;
        case ProjectTextUtility.textFirebaseInvalidVerificationId:
          res = "Invalid verification id";
          return res;
        default:
          return res;
      }
    }
    return null;
  }
}
