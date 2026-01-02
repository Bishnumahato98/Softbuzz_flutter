import 'package:hive/hive.dart';

class HiveService {
  static Future<Box> openBox(String name) async {
    return await Hive.openBox(name);
  }
}
