
import 'package:flutter/material.dart';

import '../../core/model/authentication/authentication_errors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            AuthService.singOut();
          }, child: Text('ÇIKIŞ YAP')),
          Text('Hoşgeldiniz'),
        ],
      ),
    );
  }
}
