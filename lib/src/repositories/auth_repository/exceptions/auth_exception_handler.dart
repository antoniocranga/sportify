import 'package:firebase_auth/firebase_auth.dart';
import 'package:sportify/src/utils/enums/auth_result_enum.dart';

class AuthExceptionHandler {
  static AuthResultEnum handleException(FirebaseAuthException exception) {
    switch (exception.code) {
      case "account-exists-with-different-credential":
        return AuthResultEnum.accountExistsWithDifferentCredential;
      case "invalid-credential":
        return AuthResultEnum.invalidCredential;
      case "operation-not-allowed":
        return AuthResultEnum.operationNotAllowed;
      case "invalid-verification-code":
        return AuthResultEnum.invalidVerificationCode;
      default:
        return AuthResultEnum.defaultException;
    }
  }

  //TODO add translations
  static String? exceptionMessage(AuthResultEnum authResultEnum) {
    switch (authResultEnum) {
      case AuthResultEnum.accountExistsWithDifferentCredential:
        // TODO: Handle this case.
        break;
      case AuthResultEnum.invalidCredential:
        // TODO: Handle this case.
        break;
      case AuthResultEnum.operationNotAllowed:
        // TODO: Handle this case.
        break;
      case AuthResultEnum.invalidVerificationCode:
        // TODO: Handle this case.
        break;
      case AuthResultEnum.defaultException:
        // TODO: Handle this case.
        break;
      default:
        return "An issue happened, we are trying to fix it.";
    }
  }
}