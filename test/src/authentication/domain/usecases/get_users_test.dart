import 'package:cleanarchtdd1/src/authentication/domain/entities/user.dart';
import 'package:cleanarchtdd1/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:cleanarchtdd1/src/authentication/domain/usecases/get_users.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUsers useCase;

  setUp(() {
    repository = MockAuthenticationRepository();
    useCase = GetUsers(repository);
  });

  const tResponse = [User.empty()];

  test(
    'Should call the [AuthenticationRepository.getUsers] and return [List<User>]',
    () async {
      // Arrange
      when(() => repository.getUsers())
          //thenAnswer is used to return a value when the method is called (async usecase)
          .thenAnswer((_) async => const Right(tResponse));

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(const Right<dynamic, List<User>>(tResponse)));
      verify(() => repository.getUsers()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
