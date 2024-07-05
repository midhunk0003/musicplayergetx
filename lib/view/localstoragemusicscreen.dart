import 'package:akumusicplayer/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:akumusicplayer/controller/player_controller.dart';
import 'package:akumusicplayer/core/colors.dart';
import 'package:akumusicplayer/view/playerScreen.dart';
import 'package:akumusicplayer/widgets/navigationdrawerwidget.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart'; //

class Localstoragemusicscreen extends StatelessWidget {
  Localstoragemusicscreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  var controller = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
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
            'AKU local storage',
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
        child: FutureBuilder<List<SongModel>>(
          future: controller.audioQuery.querySongs(
            ignoreCase: true,
            orderType: OrderType.ASC_OR_SMALLER,
            sortType: SongSortType.TITLE, // Specify sort type
          ),
          builder:
              (BuildContext context, AsyncSnapshot<List<SongModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Display loading indicator while waiting for data
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // Handle error scenario
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              // Display message if no songs are found
              return Center(
                child: Text('No songs found'),
              );
            } else {
              // Display list of songs
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length, // Use dynamic item count
                  itemBuilder: (BuildContext context, int index) {
                    SongModel song =
                        snapshot.data![index]; // Retrieve song model

                    return Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.only(bottom: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Obx(
                        () => InkWell(
                          onTap: () {
                            print('uriiiiii${snapshot.data![index].uri}');
                            controller.playSong(
                                snapshot.data![index].uri, index);
                            Get.to(
                              () => PlayerScreen(
                                data: snapshot.data!,
                              ),
                              transition: Transition.downToUp,
                            );
                          },
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            tileColor: bgColor,
                            title: Text(
                              "${snapshot.data![index].displayNameWOExt};", // Display song title
                              style: TextStyle(fontSize: 15, color: whiteColor),
                            ),
                            subtitle: Text(
                              song.artist ??
                                  '${snapshot.data![index].artist}', // Display artist name
                              style: TextStyle(fontSize: 12, color: whiteColor),
                            ),
                            leading: QueryArtworkWidget(
                              id: snapshot.data![index].id,
                              type: ArtworkType.AUDIO,
                              nullArtworkWidget: Icon(
                                Icons.music_note,
                                color: whiteColor,
                                size: 32,
                              ),
                            ),
                            trailing: controller.playIndex.value == index &&
                                    controller.isPlaying.value
                                ? IconButton(
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: whiteColor,
                                    ),
                                    onPressed: () {
                                      // Add functionality to play the song
                                      // You can use controller.playSong(song) to play the song
                                    },
                                  )
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
