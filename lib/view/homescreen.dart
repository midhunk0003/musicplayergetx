import 'package:akumusicplayer/controller/player_controller.dart';
import 'package:akumusicplayer/core/colors.dart';
import 'package:akumusicplayer/view/playerScreen.dart';
import 'package:akumusicplayer/widgets/navigationdrawerwidget.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler package

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
    var controller = Get.put(PlayerController());

    // Call the requestPermissions function before querying songs
    return Scaffold(
      key: _scafoldKey,
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(
            onPressed: () {
              print("search");
            },
            icon: Icon(
              Icons.search,
              color: whiteColor,
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            _scafoldKey.currentState?.openDrawer();
          },
          child: Icon(
            Icons.sort_rounded,
            color: whiteColor,
          ),
        ),
        title: Center(
          child: Text(
            'AKU home',
            style: TextStyle(
              fontSize: 20,
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: SafeArea(
          child: Center(
        child: Text("Home"),
      )),
    );
  }
}
