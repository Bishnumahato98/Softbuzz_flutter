import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Softbuzz",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF), // pure white with full opacity
                letterSpacing: 1.2,
              ),
            ),
            // Optional: Add a subtle tagline later if needed
            // SizedBox(height: 8),
            // Text("Simplify your workflow", style: ...),
          ],
        ),
      ),
    );
  }
}
