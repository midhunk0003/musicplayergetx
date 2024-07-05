import 'package:akumusicplayer/controller/player_controller.dart';
import 'package:akumusicplayer/model/save_datato_hive_wishlest.dart';
import 'package:akumusicplayer/view/homescreen.dart';
import 'package:akumusicplayer/view/wishlistscreen.dart';
import 'package:akumusicplayer/widgets/bottomnavbarwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(SongWishlestModelAdapter().typeId)) {
    Hive.registerAdapter(SongWishlestModelAdapter());
  }
  final songDB = await Hive.openBox<SongWishlestModel>('songwishlestdb');
  songDB.clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AKU MUSIC',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: Bottomnavbarwidget());
  }
}
