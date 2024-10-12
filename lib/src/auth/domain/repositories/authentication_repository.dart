import 'package:project1/core/utils/typedef.dart';
import 'package:project1/src/auth/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFuture<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar});

  ResultFuture<void> deleteUser({required int id});
  ResultFuture<List<User>> getUsers();
  ResultFuture<void> updateUser(
      {required int id,
      required String createdAt,
      required String name,
      required String avatar});
}
