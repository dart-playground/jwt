import 'package:dart_jwt/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IValidateTokenRepository {
  Future<Either<Failure, Map<String, dynamic>>> validateToken(String token);
}
