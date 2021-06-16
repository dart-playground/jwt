import 'package:dart_jwt/core/error/failure.dart';
import 'package:dart_jwt/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

abstract class IValidateToken extends IUseCase<Map<String, dynamic>, String> {
  @override
  Future<Either<Failure, Map<String, dynamic>>> call(String param);
}
