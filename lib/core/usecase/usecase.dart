import 'package:dart_jwt/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IUseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input param);
}
