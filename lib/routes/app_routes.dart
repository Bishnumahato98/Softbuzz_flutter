import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';

class AppRoutes {
  static const splash = "/";
  static const login = "/login";
  static const signup = "/signup";
  static const forgot = "/forgot";
  static const dashboard = "/dashboard";

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => SplashScreen(),
    login: (_) => LoginScreen(),
    signup: (_) => SignupScreen(),
    forgot: (_) => ForgotPasswordScreen(),
    dashboard: (_) => DashboardScreen(),
  };
}
