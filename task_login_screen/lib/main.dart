import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_login_screen/core/constants/navigation_constants.dart';
import 'package:task_login_screen/ui/shared/app_theme_data.dart';
import 'package:task_login_screen/ui/views/authenticate/login_screen.dart';
import 'package:task_login_screen/ui/views/authenticate/registration_screen.dart';
import 'package:task_login_screen/ui/views/home_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //initialize Firebase to flutter 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //AppTheme
      theme: AppThemeData.appThemeData,
      initialRoute: NavigationConstants.LOGIN_SCREEN,
      //Named Page Routes
      routes: {
        NavigationConstants.REGISTRATION_SCREEN: (context) =>
            const RegistrationScreen(),
        NavigationConstants.LOGIN_SCREEN: (context) => const LoginScreen(),
        NavigationConstants.HOME_SCREEN: (context) => const HomeScreen()
      },
    );
  }
}
