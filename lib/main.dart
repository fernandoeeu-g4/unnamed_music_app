import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_music_app/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_music_app/app/models/userdata.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:k_central_app/util/themes.dart' as appTheme;

// void main() => runApp(ModularApp(module: AppModule()));

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Future _openBoxes() async {
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(UserDataAdapter());
    return await Hive.openBox('user');
  }
  runApp(
    MaterialApp(
      // navigatorKey: Modular.navigatorKey,
      theme: ThemeData(
        fontFamily: 'Montserrat'
      ),
      darkTheme: ThemeData.dark().copyWith(
          primaryColorDark: Colors.red,
          accentColor: Colors.red,
        ),
        home: FutureBuilder(
          future: _openBoxes(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Text(snapshot.error.toString());
              else
                return ModularApp(
                  module: AppModule(),
                );
            } else {
              return Scaffold();
            }
          },
        )
    )
  );
}
