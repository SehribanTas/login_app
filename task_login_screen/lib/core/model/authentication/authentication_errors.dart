import 'package:flutter/foundation.dart';
import 'firebase_authentication.dart';
//This class converts Firebase Authentication error enums to 'String'

extension CreateUserExtensions on CreateUserExceptions {
  /// if mail already in use returns false , otherwise true
  bool get isSuccessfull => _isEmailVerification ? true : false;

  /// if mail already in use returns false , otherwise true
  bool get _isAlreadyInUse =>
      this == CreateUserExceptions.alreadyInUse ? true : false;

  /// if mail is invalid returns false ,otherwise true
  bool get _isInvalidEmail =>
      this == CreateUserExceptions.invalidEmail ? true : false;

  /// if operation not allowed returns false ,otherwise true
  bool get _isOperationNotAllowed =>
      this == CreateUserExceptions.operationNotAllowed ? true : false;

  /// if password is weak returns false ,otherwise true
  bool get _isWeakPassword =>
      this == CreateUserExceptions.weakPassword ? true : false;

  ///  if email verification mail sent returns false ,otherwise true
  bool get _isEmailVerification =>
      this == CreateUserExceptions.emailVerification ? true : false;

  String get message {
    if (_isEmailVerification) {
      return "Successful ";
    } else if (_isAlreadyInUse) {
      return "There is an account for your e-mail address!";
    } else if (_isInvalidEmail) {
      return "Invalid Mail";
    } else if (_isOperationNotAllowed) {
      return "The operation cannot be performed!";
    } else if (_isWeakPassword) {
      return "Your password must be at least 6 characters";
    } else {
      return "The operation cannot be performed!";
    }
  }
}

extension SignInExtensions on SignInExceptions {
  /// if mail is invalid returns false ,otherwise true
  bool get _isInvalidEmail =>
      this == SignInExceptions.invalidEmail ? true : false;

  /// if user is disable returns false ,otherwise true
  bool get _isUserDisabled =>
      this == SignInExceptions.userDisabled ? true : false;

  /// if user not found returns false ,otherwise true
  bool get _isUserNotFound =>
      this == SignInExceptions.userNotFound ? true : false;

  /// if password is wrong false ,otherwise true
  bool get _isWrongPassword =>
      this == SignInExceptions.wrongPassword ? true : false;

  /// if sign in succesful returns false ,otherwiseot true
  bool get isSuccesfully => this == SignInExceptions.succesfully ? true : false;

  /// if sign in unsuccesful with GOOGLE returns false ,otherwiseot true
  bool get _isUnSuccesfull =>
      this == SignInExceptions.unSuccesfull ? true : false;

  String get message {
    if (isSuccesfully) {
      return "Login successful ";
    } else if (_isInvalidEmail) {
      return "Invalid Email Address!";
    } else if (_isUserDisabled) {
      return "Invalid User!";
    } else if (_isUserNotFound) {
      return "User not found!";
    } else if (_isWrongPassword) {
      return "Wrong Password or Email Address";
    } else {
      return "Try Again";
    }
  }
}

extension UpdatePasswordExtensions on UpdatePassword {
  /// if password is weak returns false ,otherwise true
  bool get _isWeakPassword =>
      this == UpdatePassword.weakPassword ? true : false;

  /// if requires Recent Login  returns false ,otherwise true
  bool get _isRequiresRecentLogin =>
      this == UpdatePassword.requiresRecentLogin ? true : false;

  /// if sign in succesful returns false ,otherwise true
  bool get _isSuccesfully => this == UpdatePassword.succesfully ? true : false;

  String get message {
    if (_isSuccesfully) {
      return "Successful ";
    } else if (_isWeakPassword) {
      return "Password must consist of at least 6 characters";
    } else if (_isRequiresRecentLogin) {
      return "Login again ";
    } else {
      return "Try Again";
    }
  }
}

extension signInWithGoogleMobileExtensions on signInWithGoogleMobileExceptions {
  ///if there already exists an account with the email address asserted by the credential returns true, otherwise false
  bool get _isAccountExists =>
      this == signInWithGoogleMobileExceptions.accountExists ? true : false;

  ///  if the credential is malformed or has expired returns true , otherwise false
  bool get _isInvalidCredential =>
      this == signInWithGoogleMobileExceptions.invalidCredential ? true : false;

  /// if the type of account corresponding to the credential is not enabled returns true , otherwise flase
  bool get _isOperationNotAllowed =>
      this == signInWithGoogleMobileExceptions.operationNotAllowed
          ? true
          : false;

  ///if the user corresponding to the given credential has been disabled returns true , otherwise false

  bool get _isUserDisabled =>
      this == signInWithGoogleMobileExceptions.userDisabled ? true : false;

  /// Tif signing in with a credential from [EmailAuthProvider.credential] and there is no user corresponding to the given email returns true,otherwise false
  bool get _isUserNotFound =>
      this == signInWithGoogleMobileExceptions.userNotFound ? true : false;

  /// if password is wrong returns true ,otherwise false
  bool get _isWrongPassword =>
      this == signInWithGoogleMobileExceptions.wrongPassword ? true : false;

  /// if the credential is a PhoneAuthProvider.credential and the verification code of the credential is not valid returns true , otherwise true.

  bool get _isInvalidVerification =>
      this == signInWithGoogleMobileExceptions.invalidVerification
          ? true
          : false;

  /// if the credential is a PhoneAuthProvider.credential and the verification ID of the credential is not valid.id. returns true, otherwise false
  bool get _isInvalidVerificationId =>
      this == signInWithGoogleMobileExceptions.invalidVerificationId
          ? true
          : false;

  /// if succsfully returns true ,otherwise false
  bool get isSuccesfully =>
      this == signInWithGoogleMobileExceptions.succesfully ? true : false;

  String get message {
    if (isSuccesfully) {
      return "Login successful ";
    } else if (_isInvalidCredential) {
      return "Invalid Account ";
    } else if (_isOperationNotAllowed) {
      return "İşlem Geçersiz";
    } else if (_isUserDisabled) {
      return "Invalid user";
    } else if (_isUserNotFound) {
      return "User not found!";
    } else if (_isWrongPassword) {
      return "Wrong Password or Email Address";
    } else if (_isInvalidVerification) {
      return "The operation cannot be performed!";
    } else if (_isInvalidVerificationId) {
      return "The operation cannot be performed!";
    } else {
      return "The operation cannot be performed!";
    }
  }
}

extension forgetPasswordExtensions on forgetPasswordExceptions {
  bool get isSuccesfull =>
      this == forgetPasswordExceptions.succesfull ? true : false;

  bool get _isInvalidEmail =>
      this == forgetPasswordExceptions.invalidEmail ? true : false;

  /// Tif signing in with a credential from [EmailAuthProvider.credential] and there is no user corresponding to the given email returns true,otherwise false
  bool get _isMissingAndroidPkgName =>
      this == forgetPasswordExceptions.missingAndroidPkgName ? true : false;

  /// if password is wrong returns true ,otherwise false
  bool get _isMissingContinueUri =>
      this == forgetPasswordExceptions.missingContinueUri ? true : false;

  /// if the credential is a PhoneAuthProvider.credential and the verification code of the credential is not valid returns true , otherwise true.

  bool get _isMissingiosBundleId =>
      this == forgetPasswordExceptions.missingiosBundleId ? true : false;

  /// if the credential is a PhoneAuthProvider.credential and the verification ID of the credential is not valid.id. returns true, otherwise false
  bool get _isInvalidContinueUri =>
      this == forgetPasswordExceptions.invalidContinueUri ? true : false;

  /// if succsfully returns true ,otherwise false
  bool get _isUnAuthorizedContinueUri =>
      this == forgetPasswordExceptions.unAuthorizedContinueUri ? true : false;

  bool get _isUserNotFound =>
      this == forgetPasswordExceptions.userNotFound ? true : false;

  String get message {
    if (isSuccesfull) {
      return "Check Your Mail Box";
    } else if (_isMissingAndroidPkgName) {
      return "";
    } else if (_isMissingContinueUri) {
      return "Android Error";
    } else if (_isMissingiosBundleId) {
      return "Ios Error";
    } else if (_isInvalidContinueUri) {
      return "Url Invalid";
    } else if (_isUnAuthorizedContinueUri) {
      return "Url Invalid";
    } else if (_isInvalidEmail) {
      return "Invalid Mail ";
    } else {
      return "Try Again";
    }
  }
}

extension signInWithCredentialExtensions on signInWithCredentialExceptions {
  bool get isSuccesfull =>
      this == signInWithCredentialExceptions.succesfull ? true : false;

  bool get _isAccountExistsWithDifferentCredential => this ==
          signInWithCredentialExceptions.accountExistsWithDifferentCredential
      ? true
      : false;

  bool get _isInvalidCredential =>
      this == signInWithCredentialExceptions.invalidCredential ? true : false;

  bool get _isOperationNotAllowed =>
      this == signInWithCredentialExceptions.operationNotAllowed ? true : false;

  bool get _isUserDisabled =>
      this == signInWithCredentialExceptions.userDisabled ? true : false;

  bool get _isUserNotFound =>
      this == signInWithCredentialExceptions.userNotFound ? true : false;

  bool get _isWrongPassword =>
      this == signInWithCredentialExceptions.wrongPassword ? true : false;

  bool get _isInvalidVerificationCode =>
      this == signInWithCredentialExceptions.invalidVerificationCode
          ? true
          : false;
  String get message {
    if (isSuccesfull) {
      return " Login successful ";
    } else if (_isAccountExistsWithDifferentCredential) {
      return "This Account Already Exist!";
    } else if (_isInvalidCredential) {
      return "Invalid USer";
    } else if (_isOperationNotAllowed) {
      return "Try Again";
    } else if (_isUserDisabled) {
      return "Invalid user";
    } else if (_isUserNotFound) {
      return "User not found!";
    } else if (_isWrongPassword) {
      return "Wrong Password or Email Address";
    } else if (_isInvalidVerificationCode) {
      return "Your Verification Code is Incorrect";
    } else {
      return "Try Again";
    }
  }
}

class AuthService {
  static Auth auth = Auth();

  static Future<CreateUserExceptions> createUserEmailAndPassword(
      {required String mail, required String password}) async {
    try {
      CreateUserExceptions createUser =
          await auth.createUserEmailAndPassword(mail: mail, password: password);
      return createUser;
    } catch (e) {
      rethrow;
    }
  }

  static Future<SignInExceptions> loginUserEmailAndPassword(
      {required String mail, required String password}) async {
    try {
      SignInExceptions loginUser =
          await auth.loginUserEmailAndPassword(mail: mail, password: password);
      return loginUser;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static changePassword(
      {required String mail, required String password}) async {
    try {
      UpdatePassword updatePassword =
          await auth.changePassword(email: mail, password: password);
      return updatePassword;
    } catch (e) {
      rethrow;
    }
  }

  static Future<forgetPasswordExceptions> forgetPassword(
      {required String mail}) async {
    try {
      forgetPasswordExceptions forgetPassword =
          await auth.forgetPassword(email: mail);
      return forgetPassword;
    } catch (e) {
      rethrow;
    }
  }

  static Future<signInWithGoogleMobileExceptions>
      signInWithGoogleMobile() async {
    try {
      signInWithGoogleMobileExceptions signInGoogleMobile =
          await auth.signInWithGoogleMobile();
      return signInGoogleMobile;
    } catch (e) {
      rethrow;
    }
  }

  static Future<SignInExceptions> signInWithGoogleWeb() async {
    try {
      SignInExceptions signInWithGoogle = await auth.signInWithGoogleWeb();
      return signInWithGoogle;
    } catch (e) {
      rethrow;
    }
  }

  static signOutUserGoogle() => auth.signOutUser();

  static isSignedIn() => auth.isSignedIn();

  static singOut() => auth.singOut();

  static setPersist(bool checked) => auth.setPersist(checked);

  static authState() => auth.authState();

  static deleteUser() => auth.deleteUser();
  //Mobile create user phone

  static createUserWithNumberMobile({required String phoneNumber}) {
    try {
      auth.createUserWithPhoneNumberNative(phoneNumber: phoneNumber);
    } catch (e) {
      rethrow;
    }
  }

//mobile doğrulama phone
  static signInWithPhoneNumber({required String smsCode}) {
    try {
      auth.signInWithPhoneNumber(smsCode);
    } catch (e) {
      rethrow;
    }
  }

  static createUserWithNumberWeb({required String phoneNumber}) {
    try {
      auth.createUserWithNumberWeb(phoneNumber: phoneNumber);
    } catch (e) {
      rethrow;
    }
  }

  static signInWithPhoneNumberWeb({required String smsCode}) async {
    try {
      auth.signInWithPhoneNumberWeb(smsCode: smsCode);
    } catch (e) {
      rethrow;
    }
  }
}
