import 'package:project1/core/utils/typedef.dart';
import 'package:project1/src/auth/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFuture<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar});

  ResultFuture<List<User>> getUsers();

  ResultVoid updateUser(
      {required int id,
      required String createdAt,
      required String name,
      required String avatar});

  ResultVoid deleteUser({required int id});
}
