import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_music_app/app/models/TagModel.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_item/genre_item_widget.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_controller.dart';
import 'package:my_music_app/app/modules/home/genre_row/genre_row_module.dart';
import 'package:skeleton_text/skeleton_text.dart';

class GenreRowPage extends StatefulWidget {
  final String title;
  const GenreRowPage({Key key, this.title = "GenreRow"}) : super(key: key);

  @override
  _GenreRowPageState createState() => _GenreRowPageState();
}

class _GenreRowPageState extends State<GenreRowPage> {
  GenreRowController _genreRowController =
      GenreRowModule.to.get<GenreRowController>();
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: _screenWidth,
      child: Row(
        children: <Widget>[
          Observer(
            builder: (_) {
              final snapshot = _genreRowController.userTags;
              if (snapshot.value == null) {
                return Container(
                  height: 80,
                  width: _screenWidth,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffcdcdcd),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                child: SkeletonAnimation(
                                  shimmerColor: Colors.white,
                                  child: Container(
                                    width: 80,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.error != null) {
                return Text("erro!");
              }
              return Container(
                height: 80,
                width: _screenWidth,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.value.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          final TagModel tag =
                              _genreRowController.userTags.value[index];
                          return GenreItemWidget(
                              active: true, label: tag.name, index: index);
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
