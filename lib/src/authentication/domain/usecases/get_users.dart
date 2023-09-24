import 'package:cleanarchtdd1/core/usecase/usecase.dart';
import 'package:cleanarchtdd1/core/utils/type_definition.dart';
import 'package:cleanarchtdd1/src/authentication/domain/entities/user.dart';
import 'package:cleanarchtdd1/src/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UseCaseWithoutParams<List<User>> {
  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}