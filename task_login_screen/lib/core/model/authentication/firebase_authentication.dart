//This class contains  Firebase Authentication Functions, it returns authentication errors as enum
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../firebase_singleton.dart';


enum CreateUserExceptions {
  alreadyInUse,
  invalidEmail,
  operationNotAllowed,
  weakPassword,
  emailVerification,
}
//NOTE: exceptions isimlerinde typedef kullanabilirsin
extension CreateUserExtensions on CreateUserExceptions {
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
}

enum SignInExceptions {
  invalidEmail,
  userDisabled,
  userNotFound,
  wrongPassword,
  succesfully,
  unSuccesfull,
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
  bool get _isSuccesfully =>
      this == SignInExceptions.succesfully ? true : false;

  /// if sign in unsuccesful with GOOGLE returns false ,otherwiseot true
  bool get _isUnSuccesfull =>
      this == SignInExceptions.unSuccesfull ? true : false;
}

enum UpdatePassword {
  weakPassword,
  requiresRecentLogin,
  succesfully,
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
}

enum signInWithGoogleMobileExceptions {
  succesfully,
  accountExists,
  invalidCredential,
  operationNotAllowed,
  userDisabled,
  userNotFound,
  wrongPassword,
  invalidVerification,
  invalidVerificationId
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
  bool get _sUserNotFound =>
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
  bool get _isSuccesfully =>
      this == signInWithGoogleMobileExceptions.succesfully ? true : false;
}

enum forgetPasswordExceptions {
  succesfull,
  invalidEmail,
  missingAndroidPkgName,
  missingContinueUri,
  missingiosBundleId,
  invalidContinueUri,
  unAuthorizedContinueUri,
  userNotFound,
}

extension forgetPasswordExtensions on forgetPasswordExceptions {
  bool get _isSuccesfull =>
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
}

enum signInWithCredentialExceptions {
  succesfull,
  accountExistsWithDifferentCredential,
  invalidCredential,
  operationNotAllowed,
  userDisabled,
  userNotFound,
  wrongPassword,
  invalidVerificationCode,
}

extension signInWithCredentialExtensions on signInWithCredentialExceptions {
  bool get _isSuccesfull =>
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
} 


class Auth {
  static final Auth _instance = Auth._internal();
  static final _fireAuth = FirebaseAuth.instance;
  
  String _verificationId = "";
  late ConfirmationResult _confirmationResult = _confirmationResult  ;
  static late UserCredential userCredential;

  factory Auth() {
    return _instance;
  }

  Auth._internal();

  ///Creates User with Password and Email. Returns true , false or an Error.
  Future<CreateUserExceptions> createUserEmailAndPassword(
      {required String mail, required String password}) async {
    try {
      UserCredential userCredential = await _fireAuth
          .createUserWithEmailAndPassword(email: mail, password: password);
      var User = userCredential.user;

      ///Sends an Email Verification Mail
      if (!User!.emailVerified) {
        await User.sendEmailVerification();
      }
      return CreateUserExceptions.emailVerification;
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        return CreateUserExceptions.invalidEmail;
      } else if (e.code == "email-already-in-use") {
        return CreateUserExceptions.alreadyInUse;
      } else if (e.code == "operation-not-allowed") {
        return CreateUserExceptions.operationNotAllowed;
      } else if (e.code == "weak-password") {
        return CreateUserExceptions.weakPassword;
      } else {
        rethrow;
      }
    }
  }

  ///Sets User Login .If Succesfuly Completes ,It Returns True.
  Future<SignInExceptions> loginUserEmailAndPassword(
      {required mail, required password}) async {
    
    try {
      userCredential = await _fireAuth.signInWithEmailAndPassword(
          email: mail, password: password);
          userCredential= userCredential;
     
      return SignInExceptions.succesfully;
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        return SignInExceptions.invalidEmail;
      } else if (e.code == "user-disabled") {
        return SignInExceptions.userDisabled;
      } else if (e.code == "user-not-found") {
        return SignInExceptions.userNotFound;
      } else  {
        return SignInExceptions.wrongPassword;
      }
    }
  }

//This method can only be used while running on the Mobile
  Future<signInWithGoogleMobileExceptions> signInWithGoogleMobile() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      return signInWithGoogleMobileExceptions.succesfully;
    } on FirebaseAuthException catch (e) {
      
      if (e.code == "account-exists-with-different-credential") {
        return signInWithGoogleMobileExceptions.accountExists;
      } else if (e.code == "invalid-credential") {
        return signInWithGoogleMobileExceptions.invalidCredential;
      } else if (e.code == "operation-not-allowed") {
        return signInWithGoogleMobileExceptions.operationNotAllowed;
      } else if (e.code == "user-disabled") {
        return signInWithGoogleMobileExceptions.userDisabled;
      } else if (e.code == "user-not-found") {
        return signInWithGoogleMobileExceptions.userNotFound;
      } else if (e.code == "wrong-password") {
        return signInWithGoogleMobileExceptions.wrongPassword;
      } else if (e.code == "invalid-verification-code") {
        return signInWithGoogleMobileExceptions.invalidVerification;
      } else {
        return signInWithGoogleMobileExceptions.invalidVerificationId;
      }
    }
  }

//This method can only be used while running on the web
  Future<SignInExceptions> signInWithGoogleWeb() async {
    User? user;
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      final UserCredential userCredential =
          await _fireAuth.signInWithPopup(authProvider);

      user = userCredential.user;
      return SignInExceptions.succesfully;
    } on FirebaseAuthException catch (e) {
      return SignInExceptions.unSuccesfull;
    }
  }

  ///Signs out Google account
  void signOutUser() async {
    // _fireAuth.currentUser;
    var _user = GoogleSignIn().currentUser;
    if (_user != null) {
      await GoogleSignIn().signOut();
    }
    await _fireAuth.signOut();
  }

  ///Returns the Current User
  isSignedIn() => _fireAuth.currentUser;

  ///Listens the Auth State, Returns the User.
  Stream<User?> authState() {
    return _fireAuth.authStateChanges();
    
  }

  ///Sets the User Logout
  void singOut() => _fireAuth.signOut();

  ///Sets type for Persistence
  setPersist(bool checked) {
    _fireAuth.setPersistence(checked ? Persistence.LOCAL : Persistence.SESSION);
  }

  ///Deletes the User
  void deleteUser() async {
    if (_fireAuth.currentUser != null) {
      await _fireAuth.currentUser!.delete();
    } else {
      debugPrint('Please Open Session');
    }
  }

  ///Changes Password for Already Signed in User
  Future<UpdatePassword> changePassword(
      {required email, required password}) async {
    try {
      await _fireAuth.currentUser!.updatePassword('password');
      await _fireAuth.signOut();
      return UpdatePassword.succesfully;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        var credential =
            EmailAuthProvider.credential(email: email, password: password);
        await _fireAuth.currentUser!.reauthenticateWithCredential(credential);

        await _fireAuth.currentUser!.updatePassword('password');
        await _fireAuth.signOut();
        return UpdatePassword.succesfully;
      } else {
        return UpdatePassword.requiresRecentLogin;
      }
    }
  }

  Future<forgetPasswordExceptions> forgetPassword(
      {required String email}) async {
    try {
      await _fireAuth.sendPasswordResetEmail(email: email);
      return forgetPasswordExceptions.succesfull;
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        return forgetPasswordExceptions.invalidEmail;
      } else if (e.code == "auth/missing-android-pkg-name") {
        return forgetPasswordExceptions.missingAndroidPkgName;
      } else if (e.code == "auth/missing-continue-uri") {
        return forgetPasswordExceptions.missingContinueUri;
      } else if (e.code == "auth/missing-ios-bundle-id") {
        return forgetPasswordExceptions.missingiosBundleId;
      } else if (e.code == "auth/invalid-continue-uri") {
        return forgetPasswordExceptions.invalidContinueUri;
      } else if (e.code == "unauthorized-continue-uri") {
        return forgetPasswordExceptions.unAuthorizedContinueUri;
      } else {
        return forgetPasswordExceptions.userNotFound;
      }
    }
  }

  Future createUserWithPhoneNumberNative({required String phoneNumber}) async {
    //sadece web için çalışıyor.

    await _fireAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential crd = await _fireAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        });
  }

  createUserCollection({required String uid, required userInfo}) {
    FirestoreSingleton _firestore = FirestoreSingleton();
    _firestore.addCollectiontoDocument('customers', userInfo, id: uid);
  }

  Future<signInWithCredentialExceptions> signInWithPhoneNumber(
      String smsCode) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: smsCode);

      UserCredential user = await _fireAuth.signInWithCredential(credential);

      String uid = user.user!.uid;
      var userInfo = user.additionalUserInfo;
      createUserCollection(uid: uid, userInfo: userInfo);

      return signInWithCredentialExceptions.succesfull;
    } on FirebaseAuthException catch (e) {
      if (e.code == "account-exists-with-different-credential") {
        return signInWithCredentialExceptions
            .accountExistsWithDifferentCredential;
      } else if (e.code == "invalid-credential") {
        return signInWithCredentialExceptions.invalidCredential;
      } else if (e.code == "operation-not-allowed") {
        return signInWithCredentialExceptions.operationNotAllowed;
      } else if (e.code == "user-disabled") {
        return signInWithCredentialExceptions.userDisabled;
      } else if (e.code == "user-not-found") {
        return signInWithCredentialExceptions.userNotFound;
      } else if (e.code == "wrong-password") {
        return signInWithCredentialExceptions.wrongPassword;
      } else {
        return signInWithCredentialExceptions.invalidVerificationCode;
      }
    }
  }

  createUserWithNumberWeb({required String phoneNumber}) async {
    _confirmationResult = await _fireAuth.signInWithPhoneNumber(phoneNumber);
  }

  signInWithPhoneNumberWeb({required String smsCode}) async {
    UserCredential userCredential = await _confirmationResult.confirm(smsCode);
    var uid = userCredential.user!.uid;
    var userInfo = userCredential.additionalUserInfo;
    // createUserCollection(uid: uid, userInfo: userInfo);
  }

  listener(){
    _fireAuth;
  }

// SendPasswordChangeCode() async {
//       await _fireAuth.verifyPasswordResetCode(code);

//       await _fireAuth.confirmPasswordReset(code: code, newPassword: newPassword);}
}
