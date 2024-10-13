import 'package:project1/core/usecase/usecase.dart';
import 'package:project1/core/utils/typedef.dart';
import 'package:project1/src/auth/domain/entities/user.dart';
import 'package:project1/src/auth/domain/repositories/authentication_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
