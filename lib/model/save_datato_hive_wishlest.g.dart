// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_datato_hive_wishlest.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SongWishlestModelAdapter extends TypeAdapter<SongWishlestModel> {
  @override
  final int typeId = 1;

  @override
  SongWishlestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SongWishlestModel(
      uri: fields[0] as String?,
      artist: fields[1] as String?,
      year: fields[2] as int?,
      isMusic: fields[3] as bool?,
      title: fields[4] as String?,
      genreId: fields[5] as int?,
      size: fields[6] as int?,
      duration: fields[7] as int?,
      isAlarm: fields[8] as bool?,
      displayNameWithoutExtension: fields[9] as String,
      albumArtist: fields[10] as String?,
      genre: fields[11] as String?,
      isNotification: fields[12] as bool?,
      track: fields[13] as int?,
      dataPath: fields[14] as String?,
      displayName: fields[15] as String?,
      album: fields[16] as String?,
      composer: fields[17] as String?,
      isRingtone: fields[18] as bool?,
      artistId: fields[19] as int?,
      isPodcast: fields[20] as bool?,
      bookmark: fields[21] as int?,
      dateAdded: fields[22] as int?,
      isAudiobook: fields[23] as bool?,
      dateModified: fields[24] as int?,
      albumId: fields[25] as int?,
      fileExtension: fields[26] as String?,
      id: fields[27] as int?,
      singleid: fields[28] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SongWishlestModel obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.uri)
      ..writeByte(1)
      ..write(obj.artist)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.isMusic)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.genreId)
      ..writeByte(6)
      ..write(obj.size)
      ..writeByte(7)
      ..write(obj.duration)
      ..writeByte(8)
      ..write(obj.isAlarm)
      ..writeByte(9)
      ..write(obj.displayNameWithoutExtension)
      ..writeByte(10)
      ..write(obj.albumArtist)
      ..writeByte(11)
      ..write(obj.genre)
      ..writeByte(12)
      ..write(obj.isNotification)
      ..writeByte(13)
      ..write(obj.track)
      ..writeByte(14)
      ..write(obj.dataPath)
      ..writeByte(15)
      ..write(obj.displayName)
      ..writeByte(16)
      ..write(obj.album)
      ..writeByte(17)
      ..write(obj.composer)
      ..writeByte(18)
      ..write(obj.isRingtone)
      ..writeByte(19)
      ..write(obj.artistId)
      ..writeByte(20)
      ..write(obj.isPodcast)
      ..writeByte(21)
      ..write(obj.bookmark)
      ..writeByte(22)
      ..write(obj.dateAdded)
      ..writeByte(23)
      ..write(obj.isAudiobook)
      ..writeByte(24)
      ..write(obj.dateModified)
      ..writeByte(25)
      ..write(obj.albumId)
      ..writeByte(26)
      ..write(obj.fileExtension)
      ..writeByte(27)
      ..write(obj.id)
      ..writeByte(28)
      ..write(obj.singleid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongWishlestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
