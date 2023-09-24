import 'package:cleanarchtdd1/core/errors/failure.dart';
import 'package:cleanarchtdd1/core/utils/type_definition.dart';
import 'package:cleanarchtdd1/src/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();


  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  ResultFuture<List<User>> getUsers();
}