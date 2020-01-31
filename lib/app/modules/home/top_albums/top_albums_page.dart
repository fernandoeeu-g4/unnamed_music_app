import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_music_app/app/models/AlbumModel.dart';
import 'package:my_music_app/app/models/TagModel.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_controller.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_module.dart';
import 'package:my_music_app/app/modules/home/home_controller.dart';
import 'package:my_music_app/app/modules/home/home_module.dart';
import 'package:my_music_app/app/modules/home/top_albums/top_albums_controller.dart';
import 'package:my_music_app/app/modules/home/top_albums/top_albums_module.dart';

class TopAlbumsPage extends StatefulWidget {
  final String title;
  const TopAlbumsPage({Key key, this.title = "TopAlbums"}) : super(key: key);

  @override
  _TopAlbumsPageState createState() => _TopAlbumsPageState();
}

class _TopAlbumsPageState extends State<TopAlbumsPage> {
  final GenreRowController _genreRowController = GenreRowModule.to.get();
  final TopAlbumsController _topAlbumsController = TopAlbumsModule.to.get();
  @override
  void initState() {
    final int index = _genreRowController.currentTag;
    print(index);
    final TagModel tag = _genreRowController.userTags.value[index];
    print(tag.name);
    _topAlbumsController.loadTopAlbumsByTag(tag.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO tratar quando o usuário não tiver nenhuma tag (tag descubra)
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        final snapshot = _topAlbumsController.topAlbumsByTag;
        if (snapshot.value == null) 
          return CircularProgressIndicator();
        return Text(snapshot.value.length.toString());
      }),
    );
  }
}
