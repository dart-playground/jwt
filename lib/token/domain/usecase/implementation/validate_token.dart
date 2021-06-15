import 'package:dart_jwt/core/error/failure.dart';
import 'package:dart_jwt/token/domain/repository/validate_token_repository.dart';
import 'package:dart_jwt/token/domain/usecase/validate_token.dart';
import 'package:dartz/dartz.dart';

class ValidateToken extends IValidateToken {
  final IValidateTokenRepository repository;

  ValidateToken({required this.repository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call([void param]) {
    return repository.validateToken();
  }
}
