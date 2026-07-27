import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'theme/app_theme.dart';

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
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}