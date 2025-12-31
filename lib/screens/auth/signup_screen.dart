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

  final email = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();
  final pass = TextEditingController();
  final cpass = TextEditingController();

  String? selectedGender;
  Map<String, String> selectedCountry = {
    "name": "Nepal",
    "code": "+977",
    "flag": "🇳🇵",
  };
  bool termsAccepted = false;

  bool passVisible = false;
  bool cpassVisible = false;

  // List of countries with flags and codes
  final List<Map<String, String>> countries = [
    {"name": "Nepal", "code": "+977", "flag": "🇳🇵"},
    {"name": "India", "code": "+91", "flag": "🇮🇳"},
    {"name": "United States", "code": "+1", "flag": "🇺🇸"},
    {"name": "United Kingdom", "code": "+44", "flag": "🇬🇧"},
    {"name": "Canada", "code": "+1", "flag": "🇨🇦"},
    {"name": "Australia", "code": "+61", "flag": "🇦🇺"},
    {"name": "Germany", "code": "+49", "flag": "🇩🇪"},
    {"name": "France", "code": "+33", "flag": "🇫🇷"},
    {"name": "Japan", "code": "+81", "flag": "🇯🇵"},
    {"name": "China", "code": "+86", "flag": "🇨🇳"},
    {"name": "South Korea", "code": "+82", "flag": "🇰🇷"},
    {"name": "Singapore", "code": "+65", "flag": "🇸🇬"},
    {"name": "Malaysia", "code": "+60", "flag": "🇲🇾"},
    {"name": "Thailand", "code": "+66", "flag": "🇹🇭"},
    {"name": "Pakistan", "code": "+92", "flag": "🇵🇰"},
    {"name": "Bangladesh", "code": "+880", "flag": "🇧🇩"},
    {"name": "Sri Lanka", "code": "+94", "flag": "🇱🇰"},
    {"name": "UAE", "code": "+971", "flag": "🇦🇪"},
    {"name": "Saudi Arabia", "code": "+966", "flag": "🇸🇦"},
    {"name": "Qatar", "code": "+974", "flag": "🇶🇦"},
    {"name": "Italy", "code": "+39", "flag": "🇮🇹"},
    {"name": "Spain", "code": "+34", "flag": "🇪🇸"},
    {"name": "Netherlands", "code": "+31", "flag": "🇳🇱"},
    {"name": "Switzerland", "code": "+41", "flag": "🇨🇭"},
    {"name": "Sweden", "code": "+46", "flag": "🇸🇪"},
    {"name": "Norway", "code": "+47", "flag": "🇳🇴"},
    {"name": "Brazil", "code": "+55", "flag": "🇧🇷"},
    {"name": "Mexico", "code": "+52", "flag": "🇲🇽"},
    {"name": "Argentina", "code": "+54", "flag": "🇦🇷"},
    {"name": "South Africa", "code": "+27", "flag": "🇿🇦"},
    {"name": "Russia", "code": "+7", "flag": "🇷🇺"},
    {"name": "Turkey", "code": "+90", "flag": "🇹🇷"},
    {"name": "Indonesia", "code": "+62", "flag": "🇮🇩"},
    {"name": "Philippines", "code": "+63", "flag": "🇵🇭"},
    {"name": "Vietnam", "code": "+84", "flag": "🇻🇳"},
    {"name": "Egypt", "code": "+20", "flag": "🇪🇬"},
    {"name": "Nigeria", "code": "+234", "flag": "🇳🇬"},
    {"name": "Kenya", "code": "+254", "flag": "🇰🇪"},
    {"name": "New Zealand", "code": "+64", "flag": "🇳🇿"},
    {"name": "Poland", "code": "+48", "flag": "🇵🇱"},
  ];

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: 400,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Select Country",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(height: 1),
            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return ListTile(
                    leading: Text(
                      country['flag']!,
                      style: TextStyle(fontSize: 28),
                    ),
                    title: Text(country['name']!),
                    trailing: Text(
                      country['code']!,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedCountry = country;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                controller: email,
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

              // CONTACT NUMBER WITH COUNTRY CODE
              Row(
                children: [
                  // Country Code Selector
                  GestureDetector(
                    onTap: _showCountryPicker,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Text(
                            selectedCountry['flag']!,
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(width: 8),
                          Text(
                            selectedCountry['code']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_drop_down, size: 24),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Phone Number Field
                  Expanded(
                    child: CustomTextField(
                      hint: "Contact Number",
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Contact number is required";
                        }
                        if (value.length < 10) {
                          return "Enter valid contact number";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
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

              // TERMS AND CONDITIONS
              Row(
                children: [
                  Checkbox(
                    value: termsAccepted,
                    onChanged: (value) {
                      setState(() {
                        termsAccepted = value!;
                      });
                    },
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.lightBlueAccent;
                      }
                      return Colors.white;
                    }),
                  ),
                  Expanded(
                    child: Text(
                      "I accept the Terms and Conditions",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // SIGNUP BUTTON
              CustomButton(
                text: "Sign Up",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (!termsAccepted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please accept Terms and Conditions"),
                        ),
                      );
                      return;
                    }

                    // Get complete phone number with country code
                    String fullPhoneNumber =
                        "${selectedCountry['code']}${phone.text}";

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
