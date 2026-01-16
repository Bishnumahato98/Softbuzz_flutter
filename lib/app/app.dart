import 'package:flutter/material.dart';
import 'package:softbuzz_app/app/theme/app_theme.dart';
import 'package:softbuzz_app/features/splash/presentation/pages/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Softbuzz',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
