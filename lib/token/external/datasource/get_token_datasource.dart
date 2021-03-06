import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dart_jwt/token/infrastructure/datasource/get_token_datasource.dart';

class GetTokenDataSource extends IGetTokenDataSource {
  @override
  Future<String> getToken(Map<String, dynamic> param) async {
    String token;

    final jwt = JWT(
      {
        'id': param['id'],
        'role': param['role'],
        'server': {
          'id': '3e4fc296',
          'loc': 'euw-2',
        },
      },
      issuer: 'https://github.com/phferreira/dart_jwt',
    );

    token = jwt.sign(
      SecretKey(Platform.environment['SECRET_PASSWORD'].toString()),
      expiresIn: Duration(minutes: 15),
    );
    return token;
  }
}
