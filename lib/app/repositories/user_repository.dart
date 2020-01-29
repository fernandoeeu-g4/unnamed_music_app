import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:my_music_app/utils/app_constants.dart';

class UserRepository {
  UserRepository(this._dio);

  Dio _dio;

  final userBox = Hive.box('user');

  Future<Response> getUserData(user) async {
    try {
      final String _url = '${AppConstants.adonis_url}/signup';
      final _data = {"email": user.email, "google_id": user.id};
      Response response = await _dio.post(_url, data: _data);
      return response;
    } catch (e) {
      userBox.put('signinLoading', false);
      throw e;
    }
  }
}
