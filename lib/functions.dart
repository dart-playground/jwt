import 'dart:convert';

import 'package:dart_jwt/token/domain/repository/validate_token_repository.dart';
import 'package:dart_jwt/token/domain/usecase/get_token.dart';
import 'package:dart_jwt/token/domain/usecase/implementation/get_token.dart';
import 'package:dart_jwt/token/domain/usecase/implementation/validate_token.dart';
import 'package:dart_jwt/token/domain/usecase/validate_token.dart';
import 'package:dart_jwt/token/external/datasource/get_token_datasource.dart';
import 'package:dart_jwt/token/infrastructure/repository/get_token_repository.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'token/infrastructure/repository/validate_token_repository.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  IValidateTokenRepository repository = ValidateTokenRepository();
  IValidateToken validateToken = ValidateToken(repository: repository);
  var result = await validateToken(request.headers['Authorization']!.split(' ')[1]);

  return result.fold((l) => Response.forbidden(l.message), (r) => Response.ok(r.toString()));
}

@CloudFunction()
Future<Response> getToken(Request request) async {
  IGetToken usecase = GetToken(repository: GetTokenRepository(datasource: GetTokenDataSource()));
  var result = await usecase(jsonDecode(utf8.decode(base64Decode(await request.readAsString()))));
  return result.fold((l) => Response.forbidden(l.message), (r) => Response.ok(r));
}
