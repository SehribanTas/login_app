import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/navigation_constants.dart';
import '../../../core/model/authentication/authentication_errors.dart';
import '../../shared/validator_helpers.dart';
import '../../widgets/text_form_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: EdgeInsets.all(70.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    )),
                getEmailLabel(),
                getEmailFormField(),
                getPasswordLabel(),
                getPasswordFormField(),
                getRegisterButton(context),
              ],
            ),
          ),
        ),
      )),
    );
    ;
  }

  Padding getRegisterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
          onPressed: () {
            try {
              if (_formKey.currentState!.validate()) {
                loginMethod(context);
              }
            } catch (e) {
              print('Error  : $e');
            }
          },
          child: Text('Register'),
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(350, 50),
              backgroundColor: Color(0XFF3164f5))),
    );
  }

  Text_Form_Field getPasswordFormField() {
    return Text_Form_Field(
      controller: passwordController,
      hintText: 'Enter Your Password',
      validator: ValidatorHelper.emailValidator,
      obscureText: true,
    );
  }

  Padding getPasswordLabel() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Password'),
        ],
      ),
    );
  }

  Text_Form_Field getEmailFormField() {
    return Text_Form_Field(
      hintText: 'Enter Your Email Address',
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
          child: Text('Email'),
        ),
      ],
    );
  }

  void loginMethod(BuildContext context) {
    
  }
}
