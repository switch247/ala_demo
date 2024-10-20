import 'dart:convert';
import 'package:aladia/core/error/exception.dart';
import 'package:aladia/core/utils/api_helper.dart';
import 'package:aladia/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<String> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUserData(String userId);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel?> getCurrentUserData(String userId) async {
    try {
      final response = await ApiHelper.get('/profiles/$userId', null);
      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        return UserModel.fromJson(userData);
      } else {
        throw ServerException(message: 'Failed to fetch user data');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<String> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiHelper.post('/auth/login', {
        'email': email,
        'password': password,
      });
      print("{email: $email, password: $password}");
      print("object: ${response.body}");
      if (response.statusCode == 200) {
        final accessToken = jsonDecode(response.body)["accessToken"];
        return accessToken;
      } else {
        throw ServerException(message: 'Login failed: ${response.body}');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiHelper.post('/auth/signup', {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 201) {
        final userData = jsonDecode(response.body);
        return UserModel.fromJson(userData);
      } else {
        throw ServerException(message: 'Signup failed: ${response.body}');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
