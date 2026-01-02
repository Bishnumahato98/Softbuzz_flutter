import 'package:dartz/dartz.dart';
import 'package:final_project_flutter/core/error/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../models/user_hive_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, bool>> signup(UserEntity user) async {
    try {
      final model = UserHiveModel.fromEntity(user);
      return Right(await localDataSource.signup(model));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    try {
      return Right(await localDataSource.login(email, password));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
