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
          break;
        case ProjectTextUtility.textFirebaseWrongPassword:
          res = "Wrong password";
          break;
        case ProjectTextUtility.textFirebaseUserDisabled:
          res = "User disabled";
          break;
        case ProjectTextUtility.textFirebaseEmailAlreadyInUse:
          res = "Email already in use";
          break;
        case ProjectTextUtility.textFirebaseInvalidEmail:
          res = "Invalid email";
          break;
        case ProjectTextUtility.textFirebaseOperationNotAllowed:
          res = "Operation invalid";
          break;
        case ProjectTextUtility.textFirebaseWeakPassword:
          res = "Weak password";
          break;
        case ProjectTextUtility.textFirebaseAccountExistsWithDifferentCredential:
          res = "Account exists with different credential";
          break;
        case ProjectTextUtility.textFirebaseInvalidCredential:
          res = "Invalid credential";
          break;
        case ProjectTextUtility.textFirebaseInvalidVerificationCode:
          res = "Invalid verification code";
          break;
        case ProjectTextUtility.textFirebaseInvalidVerificationId:
          res = "Invalid verification id";
          break;
        default:
          return [res, userResponse?.user?.uid];
      }
    }
    return [res, userResponse?.user?.uid];
  }
}
