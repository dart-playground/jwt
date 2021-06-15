import 'package:dart_jwt/core/error/failure.dart';
import 'package:dart_jwt/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

abstract class IGetToken extends IUseCase<String, Map<String, String>> {
  @override
  Future<Either<Failure, String>> call(Map<String, String> param);
}
