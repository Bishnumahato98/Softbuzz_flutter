import 'package:final_project_flutter/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

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

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'app/app.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   runApp(const SoftBuzzApp());
// }
