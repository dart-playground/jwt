import 'package:dart_jwt/core/error/failure.dart';

class JWTExpiredFailure implements Failure {
  @override
  final String message;

  JWTExpiredFailure([this.message = '']);
}

class JWTErrorFailure implements Failure {
  @override
  final String message;

  JWTErrorFailure([this.message = '']);
}
