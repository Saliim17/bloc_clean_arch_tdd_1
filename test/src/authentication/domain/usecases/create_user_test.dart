// TESING UNIT QUESTIONS
// What does the class the depend on?
// Answer: -- AuthenticationRepository
// How can we create a fake version of the dependency?
// Answer: -- Use Mocktail or Mockito package
// How do we control what our dependency does? //MOCKTAIL OR MOCKITO PACKAGES TO DO THIS
// Answer: -- Use Mocktail's APIs

import 'package:cleanarchtdd1/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:cleanarchtdd1/src/authentication/domain/usecases/create_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';

void main() {
  late CreateUser useCase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthenticationRepository();
    useCase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();

  test(
    'Should call the [AuthenticationRepository.createUser]',
    () async {
      // Arrange
      when(() => repository.createUser(
              createdAt: any(named: 'createdAt'),
              name: any(named: 'name'),
              avatar: any(named: 'avatar')))
          //thenAnswer is used to return a value when the method is called (async usecase)
          .thenAnswer((_) async =>
              const Right(null)); //null because the method returns void

      // Act
      final result = await useCase(params);

      // Assert (using dynamic is good technique to avoid type errors??)
      expect(result, equals(const Right<dynamic, void>(null)));

      // verify that the method was called with the same params exactly
      verify(
        () => repository.createUser(
            createdAt: params.createdAt,
            name: params.name,
            avatar: params.avatar),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
