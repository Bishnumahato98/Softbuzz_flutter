// import 'package:flutter/material.dart';
// import '../../widgets/custom_button.dart';
// import '../../widgets/custom_textfield.dart';
// import '../../app/theme/app_colors.dart';
// import '../../app/routes/app_routes.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});

//   final TextEditingController usernameC = TextEditingController();
//   final TextEditingController passwordC = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: Padding(
//         padding: const EdgeInsets.all(22.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Softbuzz",
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontSize: 36,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xFFFFFFFF), // pure white with full opacity
//                 letterSpacing: 1.2,
//               ),
//             ),
//             SizedBox(height: 30),

//             CustomTextField(hint: "Username", controller: usernameC),
//             SizedBox(height: 12),

//             CustomTextField(
//               hint: "Password",
//               controller: passwordC,
//               isPassword: true,
//             ),
//             SizedBox(height: 20),

//             CustomButton(
//               text: "Login",
//               onPressed: () {
//                 Navigator.pushNamed(context, AppRoutes.dashboard);
//               },
//             ),

//             SizedBox(height: 10),
//             InkWell(
//               onTap: () {
//                 Navigator.pushNamed(context, AppRoutes.forgot);
//               },
//               child: Text(
//                 "Forgot Password?",
//                 style: TextStyle(color: AppColors.white),
//               ),
//             ),

//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Don't have account?",
//                   style: TextStyle(color: AppColors.white),
//                 ),
//                 SizedBox(width: 5),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushNamed(context, AppRoutes.signup);
//                   },
//                   child: Text(
//                     "Sign Up",
//                     style: TextStyle(
//                       color: Colors.lightBlueAccent,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../app/theme/app_colors.dart';
import '../../app/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  String? usernameError;
  String? passwordError;

  void _validateAndLogin() {
    setState(() {
      // Reset errors
      usernameError = null;
      passwordError = null;

      // Validate username
      if (usernameC.text.trim().isEmpty) {
        usernameError = "Please enter a username";
      }

      // Validate password
      if (passwordC.text.trim().isEmpty) {
        passwordError = "Please enter a password";
      }
    });

    // If no errors, navigate to dashboard
    if (usernameError == null && passwordError == null) {
      Navigator.pushNamed(context, AppRoutes.dashboard);
    }
  }

  @override
  void dispose() {
    usernameC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Softbuzz",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF),
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 30),

            // Username Field
            CustomTextField(hint: "Username", controller: usernameC),
            if (usernameError != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5),
                  child: Text(
                    usernameError!,
                    style: TextStyle(color: Colors.red[300], fontSize: 12),
                  ),
                ),
              ),
            SizedBox(height: 12),

            // Password Field
            CustomTextField(
              hint: "Password",
              controller: passwordC,
              isPassword: true,
            ),
            if (passwordError != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5),
                  child: Text(
                    passwordError!,
                    style: TextStyle(color: Colors.red[300], fontSize: 12),
                  ),
                ),
              ),
            SizedBox(height: 20),

            CustomButton(text: "Login", onPressed: _validateAndLogin),

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
