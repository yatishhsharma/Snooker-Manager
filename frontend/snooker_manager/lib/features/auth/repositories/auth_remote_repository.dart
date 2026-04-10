import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:snooker_manager/core/failure/failure.dart';
import 'package:snooker_manager/features/auth/model/api_config.dart';
import 'package:snooker_manager/features/auth/model/user_model.dart';

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("${ApiConfig.baseUrl}/auth/Signup"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        return Left(AppFailure(resBodyMap['detail'].toString()));
      }
      return Right(UserModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("${ApiConfig.baseUrl}/auth/Signin"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        return Left(
          AppFailure(resBodyMap['detail'] ?? "Unknown Text Conversion Error"),
        );
      }
      return Right(UserModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
