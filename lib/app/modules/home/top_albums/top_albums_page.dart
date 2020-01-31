import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_music_app/app/models/AlbumModel.dart';
import 'package:my_music_app/app/models/TagModel.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_controller.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_module.dart';
import 'package:image/image.dart' as Image;
import 'package:my_music_app/app/modules/home/top_albums/top_albums_controller.dart';
import 'package:my_music_app/app/modules/home/top_albums/top_albums_module.dart';
import 'package:my_music_app/utils/app_constants.dart';

class TopAlbumsPage extends StatefulWidget {
  final String title;
  const TopAlbumsPage({Key key, this.title = "TopAlbums"}) : super(key: key);

  @override
  _TopAlbumsPageState createState() => _TopAlbumsPageState();
}

class _TopAlbumsPageState extends State<TopAlbumsPage> {
  final GenreRowController _genreRowController = GenreRowModule.to.get();
  final TopAlbumsController _topAlbumsController = TopAlbumsModule.to.get();
  String tagName;
  @override
  void initState() {
    final int index = _genreRowController.currentTag;
    final TagModel tag = _genreRowController.userTags.value[index];
    setState(() {
      tagName = tag.name;
    });
    _topAlbumsController.loadTopAlbumsByTag(tag.name);
    super.initState();
  }

  Future<Widget> getImage(AlbumModel album) async {
    final url = album.image[0].text;
    final image = NetworkImage(url);
    final config = await image.obtainKey(const ImageConfiguration());
  }

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    // TODO tratar quando o usuário não tiver nenhuma tag (tag descubra)
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppConstants.primaryDarkColor
        ),
        backgroundColor: AppConstants.primaryWhite,
        elevation: 0,
        title: Text("$tagName\'s top albums", style: TextStyle(
          color: AppConstants.primaryDarkColor,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        final snapshot = _topAlbumsController.topAlbumsByTag;
        if (snapshot.value == null)
          return Center(child: CircularProgressIndicator());
        return Container(
          decoration: BoxDecoration(
            color: AppConstants.primaryWhite
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.value.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    AlbumModel album = snapshot.value[index];
                    final url = album.image[2].text;
                    print(url);
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                      child: Container(
                        // height: 120,
                        // height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: url,
                                    fit: BoxFit.fill,
                                    width: 80,
                                    height: 80,
                                    placeholder: (context, url) => Container(
                                      height: 80,
                                      width: 80,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: _screenWidth / 1.8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        album.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14),
                                      ),
                                      Text(
                                        album.artist.name,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Icon(Icons.arrow_right),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
