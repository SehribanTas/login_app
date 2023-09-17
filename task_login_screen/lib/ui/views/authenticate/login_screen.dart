import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_login_screen/core/constants/Str%C4%B1ing_constants.dart';
import 'package:task_login_screen/core/constants/navigation_constants.dart';
import 'package:task_login_screen/ui/shared/image_extensions.dart';
import 'package:task_login_screen/ui/widgets/text_form_field.dart';
import '../../../core/model/authentication/authentication_errors.dart';
import '../../../core/model/authentication/firebase_authentication.dart';
import '../../shared/validator_helpers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//GLOBAL CONSTANTS
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //UI Codes
    return Scaffold(
      appBar: getAppBar(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    padding: EdgeInsets.all(70.0), child: context.flutterIcon),
                getEmailLabel(),
                getEmailFormField(),
                getPasswordLabel(),
                getPasswordFormField(),
                getLogInButton(context),
                getForgotPasswordButton()
              ],
            ),
          ),
        ),
      )),
    );
  }

//Returns AppBar Widget
  AppBar getAppBar(BuildContext context) {
    return AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
      TextButton(
          onPressed: () {
            Navigator.pushNamed(
                context, NavigationConstants.REGISTRATION_SCREEN);
          },
          child: Text(
            StringContants.REGISTER_STRING,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ))
    ]);
  }

//Returns Forgot Button Button
  Row getForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: Text(
            StringContants.FORGOT_PASSWORD_STRING,
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {},
        )
      ],
    );
  }

//Returns Log In Button
  Padding getLogInButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
          onPressed: () {
            try {
              if (_formKey.currentState!.validate()) {
                //***call login method */
                loginMethod(context);
              }
            } catch (e) {
              print('Error  : $e');
            }
          },
          child: Text(StringContants.LOGIN_STRING),
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 50),
              backgroundColor: Color(0XFF3164f5))),
    );
  }

//return password field
  Text_Form_Field getPasswordFormField() {
    return Text_Form_Field(
      controller: passwordController,
      hintText: StringContants.ENTER_PASSWORD_STRING,
      validator: ValidatorHelper.passwordValidator,
      obscureText: true,
    );
  }

  Padding getPasswordLabel() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(StringContants.PASSWORD_STRING),
        ],
      ),
    );
  }

//return EMail Field
  Text_Form_Field getEmailFormField() {
    return Text_Form_Field(
      hintText: StringContants.ENTER_EMAIL_STRING,
      validator: ValidatorHelper.emailValidator,
      controller: mailController,
      obscureText: false,
    );
  }

  Row getEmailLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(StringContants.EMAIL_STRING),
        ),
      ],
    );
  }

  void loginMethod(BuildContext context) {
    AuthService.loginUserEmailAndPassword(
      mail: mailController.text,
      password: passwordController.text,
    ).then((SignInExceptions value) async => {
          if (value.isSuccesfully)
            {
              ///**LOGIN SUCCESFULL */
              Navigator.pushNamed(context, NavigationConstants.HOME_SCREEN),
            }
          else
            {
              //**ERROR, show toast message to user */
              Fluttertoast.showToast(
                  msg: value.name,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 16.0),
            }
        });
  }
}
