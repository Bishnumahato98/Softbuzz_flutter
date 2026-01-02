import 'package:dartz/dartz.dart';
import 'package:final_project_flutter/core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signup(UserEntity user);
  Future<Either<Failure, bool>> login(String email, String password);
}
