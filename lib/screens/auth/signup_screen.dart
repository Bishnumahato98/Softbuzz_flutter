import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../themes/app_colors.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final uname = TextEditingController();
  final username = TextEditingController();
  final pass = TextEditingController();
  final cpass = TextEditingController();

  String? selectedGender;

  bool passVisible = false;
  bool cpassVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(22),
        child: Form(
          key: _formKey,
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

              // EMAIL
              CustomTextField(
                hint: "Email ",
                controller: uname,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  if (!value.contains("@gmail.com")) {
                    return "Enter valid Gmail address";
                  }
                  return null;
                },
              ),

              SizedBox(height: 12),

              // USERNAME
              CustomTextField(
                hint: "Username",
                controller: username,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username is required";
                  }
                  if (value.length < 3) {
                    return "Username must be at least 3 characters";
                  }
                  return null;
                },
              ),

              SizedBox(height: 12),

              // GENDER
              DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                hint: Text("Select Gender"), 
                items: ["Male", "Female", "Other"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  selectedGender = value;
                },
                validator: (value) => value == null ? "Select Gender" : null,
              ),

              SizedBox(height: 12),

              // PASSWORD
              CustomTextField(
                hint: "Password",
                controller: pass,
                isPassword: !passVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    passVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey.shade700,
                  ),
                  onPressed: () {
                    setState(() {
                      passVisible = !passVisible;
                    });
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) {
                    return "Password must be 6+ characters";
                  }
                  return null;
                },
              ),

              SizedBox(height: 12),

              // CONFIRM PASSWORD
              CustomTextField(
                hint: "Confirm Password",
                controller: cpass,
                isPassword: !cpassVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    cpassVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey.shade700,
                  ),
                  onPressed: () {
                    setState(() {
                      cpassVisible = !cpassVisible;
                    });
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm your password";
                  }
                  if (value != pass.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              // SIGNUP BUTTON
              CustomButton(
                text: "Sign Up",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // ALL VALID → MOVE TO LOGIN
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Account Created Successfully!")),
                    );
                  }
                },
              ),

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
                    onTap: () => Navigator.pop(context),
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
      ),
    );
  }
}
