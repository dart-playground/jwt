import 'package:dart_jwt/core/error/failure.dart';
import 'package:dart_jwt/token/domain/errors/failures.dart';
import 'package:dart_jwt/token/domain/repository/get_token_repository.dart';
import 'package:dart_jwt/token/domain/usecase/implementation/get_token.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class GetTokenRepositoryMock extends Mock implements IGetTokenRepository {}

void main() {
  final repository = GetTokenRepositoryMock();
  final usecase = GetToken(repository: repository);

  test('Must be return a string with token', () async {
    when(() => repository.getToken(any())).thenAnswer((_) async => Right(''));
    final result = await usecase(<String, String>{});

    expect(result.isRight(), true);
    expect(result, Right<Failure, String>(''));
    verify(() => repository.getToken(any()));
  });

  test('Must be return a failure', () async {
    when(() => repository.getToken(any())).thenAnswer((_) async => Left(JWTErrorFailure()));
    final result = await usecase(<String, String>{});

    expect(result.isLeft(), true);
    expect(result, isA<Left<Failure, String>>());
    verify(() => repository.getToken(any()));
  });
}
