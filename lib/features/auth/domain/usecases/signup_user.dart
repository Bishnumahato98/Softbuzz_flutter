import 'package:dartz/dartz.dart';
import 'package:final_project_flutter/core/error/failure.dart';

import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignupUser {
  final AuthRepository repository;

  SignupUser(this.repository);

  Future<Either<Failure, bool>> call(UserEntity user) {
    return repository.signup(user);
  }
}
