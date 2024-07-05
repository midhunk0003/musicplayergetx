import 'package:akumusicplayer/model/save_datato_hive_wishlest.dart';
import 'package:akumusicplayer/view/playerScreen.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class Song {
  int id;
  Song(this.id);
}

abstract class Songmd {
  List<SongWishlestModel> list2222 = [];
}

class SongWishlistController extends GetxController {
  var songList = <SongWishlestModel>[].obs;
  var songList2 = <Song>[].obs;
  RxInt playIndex = RxInt(0);
  @override
  void onInit() {
    print("wishlist11 ${songList.toList()}");
    // TODO: implement onInit
    super.onInit();
    PlayerScreen(
      wishdata: songList,
    );
    getDatawishlest();
    playIndex = RxInt(1);
  }

  Future<void> insertdatafromuiandsavesavehive(SongWishlestModel values) async {
    print("controller value ${values.toString()}");
    final songDB = await Hive.openBox<SongWishlestModel>('songwishlestdb');
    songDB.add(values);
  }

  Future<void> getDatawishlest() async {
    final songDB = await Hive.openBox<SongWishlestModel>('songwishlestdb');
    songList.assignAll(songDB.values.toList());
  }

  // wishlist save or not

  Future<bool> isInWishlist(int id) async {
    final songDB = await Hive.openBox<SongWishlestModel>('songwishlestdb');
    for (var song in songDB.values) {
      if (song.id == id) {
        return true;
      }
    }
    return false;
    // return songList2.any((song) => song.id == id);
  }

  Future<void> toggleWishlist(int id) async {
    print("printids${id}");
    if (await isInWishlist(id)) {
      final songDB = await Hive.openBox<SongWishlestModel>('songwishlestdb');
      // int keyToDelete = id;
      // if (songDB.containsKey(keyToDelete)) {
      //   await songDB.delete(keyToDelete);
      //   print('Song deleted successfully.');
      // } else {
      //   print('Song with key $keyToDelete does not exist.');
      // }
      for (var song in songDB.values) {
        if (song.id == id) {
          await songDB.delete(id);
          
          print('Song at index $id deleted successfully.');
          print("songlistr${song.toString()}");
        }
      }
      print("idssssssssre${id}");
      songList.removeWhere((song) => song.id == id);
    } else {
      isInWishlist(id);
    }
  }
}
