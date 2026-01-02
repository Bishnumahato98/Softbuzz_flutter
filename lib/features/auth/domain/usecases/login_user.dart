import 'package:dartz/dartz.dart';
import 'package:final_project_flutter/core/error/failure.dart';
import '../repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<Either<Failure, bool>> call(String email, String password) {
    return repository.login(email, password);
  }
}
