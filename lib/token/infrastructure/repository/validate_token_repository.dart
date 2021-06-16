import 'dart:io';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dart_jwt/core/error/failure.dart';
import 'package:dart_jwt/token/domain/errors/failures.dart';
import 'package:dart_jwt/token/domain/repository/validate_token_repository.dart';
import 'package:dartz/dartz.dart';

class ValidateTokenRepository extends IValidateTokenRepository {
  @override
  Future<Either<Failure, Map<String, dynamic>>> validateToken(String token) async {
    try {
      var result = JWT.verify(token, SecretKey(Platform.environment['SECRET_PASSWORD'].toString()));
      return Right(result.payload);
    } on JWTExpiredError {
      return Left(JWTExpiredFailure('Token expired'));
    } on JWTError catch (e) {
      return Left(JWTErrorFailure(e.message));
    }
  }
}
