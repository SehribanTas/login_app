import 'package:flutter/material.dart';

import '../shared/validator_helpers.dart';

// ignore: camel_case_types
class Text_Form_Field extends StatelessWidget {
  String? Function(String?)? validator;
  String hintText;
  TextEditingController controller;
  bool obscureText =false ;
  Text_Form_Field({
    super.key,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.obscureText,
   
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 5.0, spreadRadius: 0.6)
            ]),
        child: TextFormField(
          obscureText: obscureText,
          expands: false,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
