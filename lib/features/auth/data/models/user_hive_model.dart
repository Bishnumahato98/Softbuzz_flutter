import '../../domain/entities/user_entity.dart';

class UserHiveModel {
  final String email;
  final String password;

  UserHiveModel({required this.email, required this.password});

  factory UserHiveModel.fromEntity(UserEntity user) {
    return UserHiveModel(email: user.email, password: user.password);
  }

  UserEntity toEntity() {
    return UserEntity(email: email, password: password);
  }
}
// model