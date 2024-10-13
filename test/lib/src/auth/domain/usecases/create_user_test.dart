//what does this class depend on??
// Answer -- AuthRepository
// how can we create a fake version of the dependency?
//mocktail
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project1/src/auth/domain/repositories/authentication_repository.dart';
import 'package:project1/src/auth/domain/usecases/create_user.dart';

import 'authentication_repository.mock.dart';

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUpAll(() {
    repository = MockAuthenticationRepository();
    usecase = CreateUser(repository);
  });

  final params = CreateUserParams.empty();
  test('should call [repository.createUser]', () async {
    //arange

    //stub
    when(() => repository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        )).thenAnswer((_) async => Right(null));
    //Act
    final result = await usecase(params);
    //Assert
    expect(result, equals(const Right<dynamic, void>(null)));
    verify(() => repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
