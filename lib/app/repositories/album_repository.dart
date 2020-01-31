import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:my_music_app/app/models/AlbumModel.dart';

class AlbumRepository {

  AlbumRepository(this._dio) {
    _token = userBox.get('user').token;
  }

 final Dio _dio;
 String _token;
 final userBox = Hive.box('user');
 

  Future<List<AlbumModel>> getTopAlbumsByTag(String tag) async {
      final String _url = '/top/albums/$tag';
      List<AlbumModel> albums = [];
      Response response = await _dio.post(_url, data:{'limit': 10} ,options: Options(headers: {'authorization': "Bearer $_token"} ));
      for (var json in (response.data['albums']['album'] as List)) {
        AlbumModel album = AlbumModel.fromJson(json);
        print(album.name);
        albums.add(album);
      }
      return albums;
    }


}