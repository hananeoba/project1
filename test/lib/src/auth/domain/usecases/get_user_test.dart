import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project1/src/auth/domain/entities/user.dart';
import 'package:project1/src/auth/domain/repositories/authentication_repository.dart';
import 'package:project1/src/auth/domain/usecases/get_users.dart';

import 'authentication_repository.mock.dart';

void main() {
  late GetUsers usecase;
  late AuthenticationRepository repository;
  setUp(() {
    repository = MockAuthenticationRepository();
    usecase = GetUsers(repository);
  });
  const result = [User.empty()];
  test('should call [repository.getUsers]and return list of users ', () async {
    //arange
    //stub
    when(() => repository.getUsers())
        .thenAnswer((_) async => const Right(result));
    //Act
    final e_result = await usecase();
    //Assert
    expect(e_result, equals(const Right<dynamic, List<User>>(result)));
    verify(() => repository.getUsers()).called(1);

    verifyNoMoreInteractions(repository);
  });
}
