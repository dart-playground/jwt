import 'package:dart_jwt/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IGetTokenRepository {
  Future<Either<Failure, String>> getToken(Map<String, String> param);
}
