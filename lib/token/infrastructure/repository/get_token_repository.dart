import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dart_jwt/core/error/failure.dart';
import 'package:dart_jwt/token/domain/errors/failures.dart';
import 'package:dart_jwt/token/domain/repository/get_token_repository.dart';
import 'package:dart_jwt/token/infrastructure/datasource/get_token_datasource.dart';
import 'package:dartz/dartz.dart';

class GetTokenRepository extends IGetTokenRepository {
  final IGetTokenDataSource datasource;

  GetTokenRepository({required this.datasource});

  @override
  Future<Either<Failure, String>> getToken(Map<String, dynamic> param) async {
    String result;
    try {
      result = await datasource.getToken(param);
    } on JWTExpiredError {
      return Left(JWTExpiredFailure());
    } catch (e) {
      return Left(JWTErrorFailure('Error on call datasource in repository'));
    }

    return result.isNotEmpty ? Right(result) : Left(JWTErrorFailure());
  }
}
