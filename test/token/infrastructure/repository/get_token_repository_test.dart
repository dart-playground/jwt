import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dart_jwt/core/error/failure.dart';
import 'package:dart_jwt/token/infrastructure/datasource/get_token_datasource.dart';
import 'package:dart_jwt/token/infrastructure/repository/get_token_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class GetTokenDataSourceMock extends Mock implements IGetTokenDataSource {}

void main() {
  final datasource = GetTokenDataSourceMock();
  final repository = GetTokenRepository(datasource: datasource);

  test('Must be return a string token', () async {
    when(() => datasource.getToken(any())).thenAnswer((_) async => 'teste');

    final result = await repository.getToken(<String, dynamic>{});
    expect(result.isRight(), true);
    expect(result, Right<Failure, String>('teste'));
    verify(() => datasource.getToken(any()));
  });

  test('Must be return a Failure of Expired', () async {
    when(() => datasource.getToken(any())).thenThrow(JWTExpiredError());

    final result = await repository.getToken(<String, dynamic>{});
    expect(result.isLeft(), true);
    expect(result, isA<Left<Failure, String>>());
    verify(() => datasource.getToken(any()));
  });

  test('Must be return a Failure of Error', () async {
    when(() => datasource.getToken(any())).thenThrow(Exception());

    final result = await repository.getToken(<String, dynamic>{});
    expect(result.isLeft(), true);
    expect(result, isA<Left<Failure, String>>());
    verify(() => datasource.getToken(any()));
  });
}
