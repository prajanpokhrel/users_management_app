import 'package:dio/dio.dart';

import 'package:user_manage_app/core/models/user_model.dart';

class Api {
  final dio = Dio();
  Future<List<UserModel>> getUser() async {
    try {
      final response = await dio.get("https://reqres.in/api/users");
      return (response.data['data'] as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception("Failed to load users");
    }
  }
}
