import 'package:dio/dio.dart';

import 'package:user_manage_app/core/models/user_model.dart';

class Api {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _dio.get("/users");
      return (response.data['data'] as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to load users");
    }
  }
}
