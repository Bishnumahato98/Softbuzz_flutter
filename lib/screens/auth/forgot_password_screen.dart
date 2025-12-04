import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../themes/app_colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final emailC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 90, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text(
              "Forgot Password",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            Text(
              "Enter your email to reset password",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.white),
            ),
            SizedBox(height: 30),

            CustomTextField(hint: "Enter Email", controller: emailC),
            SizedBox(height: 20),

            CustomButton(text: "Submit", onPressed: () {}),
            SizedBox(height: 20),

            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "← Back to Login",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
