import 'package:akumusicplayer/model/save_datato_hive_wishlest.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  RxInt playIndex = RxInt(-1);
  var isPlaying = false.obs;
  final audioQuery = new OnAudioQuery();
  final audioPlayer = new AudioPlayer();

  var duration = ''.obs;
  var position = ''.obs;

  var max = 0.0.obs;
  var value = 0.0.obs;

  @override
  void onInit() {
    checkPermission();
    super.onInit();
    print(123);
    playIndex = RxInt(1);
  }

  updatePosition() {
    audioPlayer.durationStream.listen((d) {
      duration.value = d.toString().split(".")[0];
      max.value = d!.inSeconds.toDouble();
    });
    audioPlayer.positionStream.listen((p) {
      position.value = p.toString().split(".")[0];
      value.value = p.inSeconds.toDouble();
    });
  }

  changeDurationToSecond(seconds) {
    var duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
  }

  playSong(String? uri, int index) {
    playIndex.value = index;
    print('1111111111111${uri}');
    try {
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      audioPlayer.play();
      isPlaying(true);
      updatePosition();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  checkPermission() async {
    // bool hasPermission = await storagePermission();
    PermissionStatus per = await Permission.audio.request();
    if (per == PermissionStatus.granted) {
      // Perform the required actions, such as querying songs
    } else if (per == PermissionStatus.denied) {
      await Permission.audio.request();
      // If permission is permanently denied, guide the user to app settings
      checkPermission();
      // openAppSettings();
    } else {
      checkPermission();
    }
  }
}
