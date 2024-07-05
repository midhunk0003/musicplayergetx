import 'package:akumusicplayer/controller/player_controller.dart';
import 'package:akumusicplayer/controller/wishlstcontroller.dart';
import 'package:akumusicplayer/core/colors.dart';
import 'package:akumusicplayer/model/save_datato_hive_wishlest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerScreen extends StatelessWidget {
  final List<SongModel>? data;
  final List<SongWishlestModel>? wishdata;
  const PlayerScreen({Key? key, this.data, this.wishdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();
    var controller2 = Get.find<SongWishlistController>();
    final SongWishlistController songWishlistController =
        Get.put(SongWishlistController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Center(child: Text('PLAY SONG')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: data == null
                      ? QueryArtworkWidget(
                          id: wishdata![controller.playIndex.value].id!,
                          type: ArtworkType.AUDIO,
                          artworkHeight: double.infinity,
                          artworkWidth: double.infinity,
                          nullArtworkWidget: const Icon(
                            Icons.music_note,
                            color: whiteColor,
                            size: 40,
                          ),
                        )
                      : QueryArtworkWidget(
                          id: data![controller.playIndex.value].id,
                          type: ArtworkType.AUDIO,
                          artworkHeight: double.infinity,
                          artworkWidth: double.infinity,
                          nullArtworkWidget: const Icon(
                            Icons.music_note,
                            color: whiteColor,
                            size: 40,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 233, 230, 230),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Obx(
                  () => Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      data == null
                          ? Text(
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              wishdata![controller.playIndex.value]
                                  .displayName!,
                              style: TextStyle(
                                  color: bgDarkColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              data![controller.playIndex.value].displayName,
                              style: TextStyle(
                                  color: bgDarkColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                      const SizedBox(
                        height: 12,
                      ),
                      data == null
                          ? Text(
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              wishdata![controller.playIndex.value]
                                  .artist
                                  .toString(),
                              style: TextStyle(
                                color: bgDarkColor,
                                fontSize: 18,
                              ),
                            )
                          : Text(
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              data![controller.playIndex.value]
                                  .artist
                                  .toString(),
                              style: TextStyle(
                                color: bgDarkColor,
                                fontSize: 18,
                              ),
                            ),
                      const SizedBox(
                        height: 12,
                      ),
                      data == null
                          ? Obx(
                              () => Row(
                                children: [
                                  Text(
                                    controller.position.value,
                                    style: TextStyle(color: bgColor),
                                  ),
                                  Expanded(
                                    child: Slider(
                                      thumbColor: sliderColor,
                                      inactiveColor: whiteColor,
                                      min: const Duration(seconds: 0)
                                          .inSeconds
                                          .toDouble(),
                                      max: controller.max.value,
                                      value: controller.value.value,
                                      onChanged: (newValue) {
                                        controller.changeDurationToSecond(
                                            newValue.toInt());
                                        newValue = newValue;
                                      },
                                    ),
                                  ),
                                  Text(
                                    controller.duration.value,
                                    style: TextStyle(color: bgColor),
                                  ),
                                ],
                              ),
                            )
                          : Obx(
                              () => Row(
                                children: [
                                  Text(
                                    controller.position.value,
                                    style: TextStyle(color: bgColor),
                                  ),
                                  Expanded(
                                    child: Slider(
                                      thumbColor: sliderColor,
                                      inactiveColor: whiteColor,
                                      min: const Duration(seconds: 0)
                                          .inSeconds
                                          .toDouble(),
                                      max: controller.max.value,
                                      value: controller.value.value,
                                      onChanged: (newValue) {
                                        controller.changeDurationToSecond(
                                            newValue.toInt());
                                        newValue = newValue;
                                      },
                                    ),
                                  ),
                                  Text(
                                    controller.duration.value,
                                    style: TextStyle(color: bgColor),
                                  ),
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Calculate the previous index
                              int previousIndex =
                                  controller.playIndex.value - 1;

                              // Check if the previous index is within the bounds of the list
                              if (previousIndex >= 0) {
                                // Print the value and play the song
                                // print(
                                //     'valuesssssss,${data![previousIndex].id}');
                                data == null
                                    ? controller.playSong(
                                        wishdata![previousIndex].uri,
                                        previousIndex)
                                    : controller.playSong(
                                        data![previousIndex].uri,
                                        previousIndex);
                              } else {
                                // Optionally, handle the case when previousIndex is out of bounds
                                print('You are at the beginning of the list');
                              }
                            },
                            icon: Icon(
                              Icons.skip_previous_rounded,
                              size: 40,
                              color: bgDarkColor,
                            ),
                          ),
                          Obx(
                            () => CircleAvatar(
                              radius: 35,
                              backgroundColor: bgColor,
                              child: Transform.scale(
                                  scale: 3,
                                  child: IconButton(
                                    onPressed: () {
                                      if (controller.isPlaying.value) {
                                        controller.audioPlayer.pause();
                                        controller.isPlaying(false);
                                      } else {
                                        controller.audioPlayer.play();
                                        controller.isPlaying(true);
                                      }
                                    },
                                    icon: controller.isPlaying.value
                                        ? Icon(
                                            Icons.pause,
                                          )
                                        : Icon(
                                            Icons.play_arrow_rounded,
                                          ),
                                  )),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              int nextIndex = controller.playIndex.value + 1;
                              // Check if the next index is within the bounds of the list
                              int length = data == null
                                  ? wishdata!.length
                                  : data!.length;
                              if (nextIndex < length) {
                                // Print the value and play the song
                                // print('valuesssssss,${data![nextIndex].id}');
                                data == null
                                    ? controller.playSong(
                                        wishdata![nextIndex].uri, nextIndex)
                                    : controller.playSong(
                                        data![nextIndex].uri, nextIndex);
                              } else {
                                // Optionally, handle the case when nextIndex is out of bounds
                                print('Reached the end of the list');
                              }
                            },
                            icon: Icon(
                              Icons.skip_next_rounded,
                              size: 40,
                              color: bgDarkColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        // int currentSongId = controller.playIndex.value;
                        // bool isInWishlist =
                        //     songWishlistController.isInWishlist(currentSongId);
                        int currentSongId = data == null
                            ? wishdata![controller.playIndex.value].id!
                            : data![controller.playIndex.value].id;
                        // bool isInWishlistfuture =
                        //     songWishlistController.isInWishlist(currentSongId);
                        // .any((song) => song.id == currentSongId);

                        return FutureBuilder<bool>(
                          future: songWishlistController
                              .isInWishlist(currentSongId),
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text("Error: ${snapshot.error}");
                            } else {
                              bool isInWishlistfuture = snapshot.data ?? false;
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      data == null
                                          ? IconButton(
                                              iconSize: 30,
                                              onPressed: isInWishlistfuture
                                                  ? () {
                                                      final id = wishdata![
                                                              controller
                                                                  .playIndex
                                                                  .value]
                                                          .id;
                                                      songWishlistController
                                                          .toggleWishlist(id!);
                                                      print(
                                                          "remove wishlist data");
                                                    }
                                                  : () {
                                                      print(
                                                          "add wishlist data");
                                                      songWishlistController
                                                          .toggleWishlist(
                                                              currentSongId);
                                                      getdatatosavehivewid(
                                                          controller
                                                              .playIndex.value);
                                                      print(
                                                          "wishlist${data![controller.playIndex.value]}");
                                                    },
                                              icon: Icon(Icons.favorite),
                                              color: isInWishlistfuture
                                                  ? Color.fromARGB(
                                                      255, 192, 3, 3)
                                                  : Color.fromARGB(
                                                      255, 70, 67, 67),
                                            )
                                          : IconButton(
                                              iconSize: 30,
                                              onPressed: isInWishlistfuture
                                                  ? () {
                                                      final id = data![
                                                              controller
                                                                  .playIndex
                                                                  .value]
                                                          .id;
                                                      songWishlistController
                                                          .toggleWishlist(id!);
                                                      print(
                                                          "remove wishlist data");
                                                    }
                                                  : () {
                                                      print(
                                                          "add wishlist data");
                                                      songWishlistController
                                                          .toggleWishlist(
                                                              currentSongId);
                                                      getdatatosavehivewid(
                                                          controller
                                                              .playIndex.value);
                                                      print(
                                                          "wishlist${data![controller.playIndex.value]}");
                                                    },
                                              icon: Icon(Icons.favorite),
                                              color: isInWishlistfuture
                                                  ? Color.fromARGB(
                                                      255, 192, 3, 3)
                                                  : Color.fromARGB(
                                                      255, 70, 67, 67),
                                            ),
                                      Center(child: Text("Add wishlist")),
                                    ],
                                  )
                                ],
                              );
                            }
                          },
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getdatatosavehivewid(values) {
    final SongWishlistController songWishlistController1 =
        Get.put(SongWishlistController());
    final val = songWishlistController1.songList;
    final iu1 = val.toList();
    final id = iu1.isEmpty ? 1 : iu1.last.id! + 1;
    final value1s = SongWishlestModel(
      singleid: id,
      uri: data![values].uri,
      artist: data![values].artist,
      // year: data![values],
      isMusic: data![values].isMusic,
      title: data![values].title,
      size: data![values].size,
      duration: data![values].duration,
      isAlarm: data![values].isAlarm,
      displayNameWithoutExtension: data![values].displayNameWOExt,
      isNotification: data![values].isNotification,
      track: data![values].track,
      dataPath: data![values].data,
      displayName: data![values].displayName,
      album: data![values].album,
      isRingtone: data![values].isRingtone,
      artistId: data![values].artistId,
      isPodcast: data![values].isPodcast,
      bookmark: data![values].bookmark,
      dateAdded: data![values].dateAdded,
      isAudiobook: data![values].isAudioBook,
      dateModified: data![values].dateModified,
      albumId: data![values].albumId,
      fileExtension: data![values].fileExtension,
      id: data![values].id,
    );
    SongWishlistController().insertdatafromuiandsavesavehive(value1s);
  }
}
