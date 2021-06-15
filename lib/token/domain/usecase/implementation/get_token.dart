import 'package:dart_jwt/core/error/failure.dart';
import 'package:dart_jwt/token/domain/repository/get_token_repository.dart';
import 'package:dart_jwt/token/domain/usecase/get_token.dart';
import 'package:dartz/dartz.dart';

class GetToken extends IGetToken {
  final IGetTokenRepository repository;

  GetToken({required this.repository});

  @override
  Future<Either<Failure, String>> call(Map<String, String> param) async {
    return await repository.getToken(param);
  }
}
