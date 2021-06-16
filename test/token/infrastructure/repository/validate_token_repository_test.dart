import 'package:dart_jwt/core/error/failure.dart';
import '../../utils/token.dart';
import 'package:dart_jwt/token/infrastructure/repository/validate_token_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

void main() {
  final repository = ValidateTokenRepository();

  test('Must be return a json Map<String, dynamic>', () async {
    var result = await repository.validateToken(validToken);
    expect(result.isRight(), true);
    expect(result, isA<Right<Failure, Map<String, dynamic>>>());
  });

  test('Must be return a JWTExpiredFailure', () async {
    var result = await repository.validateToken(invalidToken);
    expect(result.isLeft(), true);
    expect(result, isA<Left<Failure, Map<String, dynamic>>>());
  });
}
