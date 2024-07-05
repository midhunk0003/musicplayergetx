import 'package:hive_flutter/hive_flutter.dart';

part 'save_datato_hive_wishlest.g.dart';

@HiveType(typeId: 1)
class SongWishlestModel {
  @HiveField(0)
  final String? uri;
  @HiveField(1)
  final String? artist;
  @HiveField(2)
  final int? year;
  @HiveField(3)
  final bool? isMusic;
  @HiveField(4)
  final String? title;
  @HiveField(5)
  final int? genreId;
  @HiveField(6)
  final int? size;
  @HiveField(7)
  final int? duration;
  @HiveField(8)
  final bool? isAlarm;
  @HiveField(9)
  final String displayNameWithoutExtension;
  @HiveField(10)
  final String? albumArtist;
  @HiveField(11)
  final String? genre;
  @HiveField(12)
  final bool? isNotification;
  @HiveField(13)
  final int? track;
  @HiveField(14)
  final String? dataPath;
  @HiveField(15)
  final String? displayName;
  @HiveField(16)
  final String? album;
  @HiveField(17)
  final String? composer;
  @HiveField(18)
  final bool? isRingtone;
  @HiveField(19)
  final int? artistId;
  @HiveField(20)
  final bool? isPodcast;
  @HiveField(21)
  final int? bookmark;
  @HiveField(22)
  final int? dateAdded;
  @HiveField(23)
  final bool? isAudiobook;
  @HiveField(24)
  final int? dateModified;
  @HiveField(25)
  final int? albumId;
  @HiveField(26)
  final String? fileExtension;
  @HiveField(27)
  final int? id;
  @HiveField(28)
  final int? singleid;

  SongWishlestModel({
    required this.uri,
    this.artist = '<unknown>',
    this.year,
    required this.isMusic,
    required this.title,
    this.genreId,
    required this.size,
    required this.duration,
    required this.isAlarm,
    required this.displayNameWithoutExtension,
    this.albumArtist,
    this.genre,
    required this.isNotification,
    required this.track,
    required this.dataPath,
    required this.displayName,
    required this.album,
    this.composer,
    required this.isRingtone,
    required this.artistId,
    required this.isPodcast,
    required this.bookmark,
    required this.dateAdded,
    required this.isAudiobook,
    required this.dateModified,
    required this.albumId,
    required this.fileExtension,
    required this.id,
    required this.singleid,
  });

  @override
  String toString() {
    return 'YourClassNameHere{'
        'uri: $uri, '
        'artist: $artist, '
        'year: $year, '
        'isMusic: $isMusic, '
        'title: $title, '
        'genreId: $genreId, '
        'size: $size, '
        'duration: $duration, '
        'isAlarm: $isAlarm, '
        'displayNameWithoutExtension: $displayNameWithoutExtension, '
        'albumArtist: $albumArtist, '
        'genre: $genre, '
        'isNotification: $isNotification, '
        'track: $track, '
        'dataPath: $dataPath, '
        'displayName: $displayName, '
        'album: $album, '
        'composer: $composer, '
        'isRingtone: $isRingtone, '
        'artistId: $artistId, '
        'isPodcast: $isPodcast, '
        'bookmark: $bookmark, '
        'dateAdded: $dateAdded, '
        'isAudiobook: $isAudiobook, '
        'dateModified: $dateModified, '
        'albumId: $albumId, '
        'fileExtension: $fileExtension, '
        'id: $id}'
        'singleid : $singleid';
  }

  factory SongWishlestModel.fromJson(Map<String, dynamic> json) {
    return SongWishlestModel(
      uri: json['_uri'] as String,
      artist: json['artist'] as String? ?? '<unknown>',
      year: json['year'] as int?,
      isMusic: json['is_music'] as bool,
      title: json['title'] as String,
      genreId: json['genre_id'] as int?,
      size: json['_size'] as int,
      duration: json['duration'] as int,
      isAlarm: json['is_alarm'] as bool,
      displayNameWithoutExtension: json['_display_name_wo_ext'] as String,
      albumArtist: json['album_artist'] as String?,
      genre: json['genre'] as String?,
      isNotification: json['is_notification'] as bool,
      track: json['track'] as int,
      dataPath: json['_data'] as String,
      displayName: json['_display_name'] as String,
      album: json['album'] as String,
      composer: json['composer'] as String?,
      isRingtone: json['is_ringtone'] as bool,
      artistId: json['artist_id'] as int,
      isPodcast: json['is_podcast'] as bool,
      bookmark: json['bookmark'] as int,
      dateAdded: json['date_added'] as int,
      isAudiobook: json['is_audiobook'] as bool,
      dateModified: json['date_modified'] as int,
      albumId: json['album_id'] as int,
      fileExtension: json['file_extension'] as String,
      id: json['_id'] as int,
      singleid: json['singleid'] as int,
    );
  }
}
