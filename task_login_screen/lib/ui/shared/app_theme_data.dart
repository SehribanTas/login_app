//This class contains app theme properties for all widgets
import 'package:flutter/material.dart';

class AppThemeData{
   static ThemeData appThemeData =  ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            helperMaxLines: 1,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                    color: Colors.transparent,
                    style: BorderStyle.none,
                    width: 1.0)),
            outlineBorder: BorderSide(
                color: Colors.transparent,
                strokeAlign: BorderSide.strokeAlignCenter,
                style: BorderStyle.solid),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                borderSide: BorderSide(
                    color: Colors.transparent,
                    style: BorderStyle.none,
                    width: 1.0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                    color: Colors.transparent,
                    style: BorderStyle.none,
                    width: 1.0)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                    color: Colors.transparent,
                    style: BorderStyle.none,
                    width: 4.0)),
            labelStyle: TextStyle(color: Colors.black)),
      );
      

}