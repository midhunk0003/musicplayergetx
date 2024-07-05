import 'package:akumusicplayer/controller/player_controller.dart';
import 'package:akumusicplayer/controller/wishlstcontroller.dart';
import 'package:akumusicplayer/core/colors.dart';
import 'package:akumusicplayer/model/save_datato_hive_wishlest.dart';
import 'package:akumusicplayer/view/playerScreen.dart';
import 'package:akumusicplayer/widgets/navigationdrawerwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wishlistscreen extends StatelessWidget {
  Wishlistscreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  final SongWishlistController songWishlistController =
      Get.put(SongWishlistController());
  var controller = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      drawer: MyDrawer(),
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
            'favourite Song',
            style: TextStyle(
              fontSize: 20,
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Obx(
        () {
          return (songWishlistController.songList.isEmpty)
              ? const Center(
                  child: Text("no favourite  song "),
                )
              : ListView.builder(
                  itemCount: songWishlistController.songList.length,
                  itemBuilder: (BuildContext context, index) {
                    SongWishlestModel song =
                        songWishlistController.songList[index];
                        return InkWell(
                          onTap: () {
                            String? uri = song
                                .uri; // Assuming you have URI stored in Hive
                            if (uri != null) {
                              controller.playSong(uri, index);
                            }

                            Get.to(
                              () => PlayerScreen(
                                wishdata: songWishlistController.songList,
                              ),
                              transition: Transition.downToUp,
                            );
                          },
                          child: ListTile(
                            title: Text(song.artist!),
                            subtitle: Text(song.album!),
                          ),
                        );
                  },
                );
        },
      ),
    );
  }
}
