import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(title: Text("Dashboard"), backgroundColor: Colors.black87),
      body: Center(
        child: Text(
          "Dashboard is Empty",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
