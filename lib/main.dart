import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const SoftBuzzApp());
}

class SoftBuzzApp extends StatelessWidget {
  const SoftBuzzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
