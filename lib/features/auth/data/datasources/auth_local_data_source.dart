import 'package:hive/hive.dart';
import '../models/user_hive_model.dart';

class AuthLocalDataSource {
  final Box box;

  AuthLocalDataSource(this.box);

  Future<bool> signup(UserHiveModel user) async {
    await box.put(user.email, user.password);
    return true;
  }

  Future<bool> login(String email, String password) async {
    final savedPassword = box.get(email);
    return savedPassword == password;
  }
}
// data