import 'package:cleanarchtdd1/core/usecase/usecase.dart';
import 'package:cleanarchtdd1/core/utils/type_definition.dart';
import 'package:cleanarchtdd1/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class CreateUser extends UseCaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty()
      : this(
            createdAt: '_empty.createdAt',
            name: '_empty.name',
            avatar: '_empty.avatar');

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object> get props => [createdAt, name, avatar];
}
