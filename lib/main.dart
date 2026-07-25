import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const DondhuApp());
}

class DondhuApp extends StatelessWidget {
  const DondhuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dondhu',
      home: const LoginScreen(),
    );
  }
}