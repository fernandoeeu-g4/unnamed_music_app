import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:my_music_app/app/models/TagModel.dart';
import 'package:my_music_app/utils/app_constants.dart';

class UserRepository {
  final userBox = Hive.box('user');

  Dio _dio;
  String token;

  UserRepository(this._dio) {
    print(userBox.get('user'));
    this.token = userBox.get('user').token;
  }

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

  Future<List<TagModel>> getUserTags() async {
    final String _url = '${AppConstants.adonis_url}/user/tags';
    Response response = await _dio.get(_url,
        options: Options(headers: {'authorization': "Bearer $token"}));
    List<TagModel> userTags = [];
    userTags.add(TagModel(id: -1, name: 'Descubra', url: null));
    for (var json in (response.data as List)) {
      TagModel tag = TagModel.fromJson(json);
      userTags.add(tag);
    }
    return userTags;
  }
}
