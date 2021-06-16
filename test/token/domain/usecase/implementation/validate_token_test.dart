import 'package:dart_jwt/core/error/failure.dart';
import '../../../utils/token.dart';
import 'package:dart_jwt/token/domain/errors/failures.dart';
import 'package:dart_jwt/token/domain/repository/validate_token_repository.dart';
import 'package:dart_jwt/token/domain/usecase/implementation/validate_token.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class ValidateTokenRepositgoryMock extends Mock implements IValidateTokenRepository {}

void main() {
  final repository = ValidateTokenRepositgoryMock();
  final usecase = ValidateToken(repository: repository);

  test('Must be return a json response', () async {
    when(() => usecase(any())).thenAnswer((_) async => Right(<String, dynamic>{}));

    var result = await usecase(validToken);
    expect(result.isRight(), true);
    expect(result, isA<Right<Failure, Map<String, dynamic>>>());
    verify(() => repository.validateToken(any()));
  });

  test('Must be return a failure', () async {
    when(() => usecase(any())).thenAnswer((_) async => Left(JWTExpiredFailure()));

    var result = await usecase(invalidToken);
    expect(result.isLeft(), true);
    expect(result, isA<Left<Failure, Map<String, dynamic>>>());
    verify(() => repository.validateToken(any()));
  });
}
