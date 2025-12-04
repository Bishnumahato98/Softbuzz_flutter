import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../themes/app_colors.dart';
import '../../routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", width: 90),
            SizedBox(height: 20),
            Text(
              "Login",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

            CustomTextField(hint: "Username", controller: usernameC),
            SizedBox(height: 12),

            CustomTextField(
              hint: "Password",
              controller: passwordC,
              isPassword: true,
            ),
            SizedBox(height: 20),

            CustomButton(
              text: "Login",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.dashboard);
              },
            ),

            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.forgot);
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: AppColors.white),
              ),
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account?",
                  style: TextStyle(color: AppColors.white),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.signup);
                  },
                  child: Text(
                    "Sign Up",
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
