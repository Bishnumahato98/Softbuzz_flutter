import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../themes/app_colors.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final uname = TextEditingController();
  final phone = TextEditingController();
  final age = TextEditingController();
  final pass = TextEditingController();
  final cpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Text(
              "Signup",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

            CustomTextField(hint: "Username", controller: uname),
            SizedBox(height: 12),

            CustomTextField(hint: "Phone Number", controller: phone),
            SizedBox(height: 12),

            CustomTextField(hint: "Enter Age", controller: age),
            SizedBox(height: 12),

            CustomTextField(
              hint: "Password",
              controller: pass,
              isPassword: true,
            ),
            SizedBox(height: 12),

            CustomTextField(
              hint: "Confirm Password",
              controller: cpass,
              isPassword: true,
            ),
            SizedBox(height: 20),

            CustomButton(text: "Sign Up", onPressed: () {}),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: AppColors.white),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
