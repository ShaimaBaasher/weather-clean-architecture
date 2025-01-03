// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_main_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMainClassAdapter extends TypeAdapter<HiveMainClass> {
  @override
  final int typeId = 1;

  @override
  HiveMainClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMainClass(
      temp: fields[0] as double,
      pressure: fields[1] as int,
      humidity: fields[2] as int,
      feelsLike: fields[3] as int,
      tempMin: fields[4] as int,
      tempMax: fields[5] as int,
      seaLevel: fields[6] as int,
      grndLevel: fields[7] as int,
      tempKf: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveMainClass obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.pressure)
      ..writeByte(2)
      ..write(obj.humidity)
      ..writeByte(3)
      ..write(obj.feelsLike)
      ..writeByte(4)
      ..write(obj.tempMin)
      ..writeByte(5)
      ..write(obj.tempMax)
      ..writeByte(6)
      ..write(obj.seaLevel)
      ..writeByte(7)
      ..write(obj.grndLevel)
      ..writeByte(8)
      ..write(obj.tempKf);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMainClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveWeatherAdapter extends TypeAdapter<HiveWeather> {
  @override
  final int typeId = 2;

  @override
  HiveWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveWeather(
      id: fields[0] as int,
      main: fields[1] as String,
      description: fields[2] as String,
      icon: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveWeather obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveCloudsAdapter extends TypeAdapter<HiveClouds> {
  @override
  final int typeId = 3;

  @override
  HiveClouds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveClouds(
      all: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveClouds obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.all);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCloudsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveWindAdapter extends TypeAdapter<HiveWind> {
  @override
  final int typeId = 4;

  @override
  HiveWind read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveWind(
      speed: fields[0] as double,
      deg: fields[1] as int,
      gust: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HiveWind obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.speed)
      ..writeByte(1)
      ..write(obj.deg)
      ..writeByte(3)
      ..write(obj.gust);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveWindAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveSysAdapter extends TypeAdapter<HiveSys> {
  @override
  final int typeId = 5;

  @override
  HiveSys read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSys(
      pod: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveSys obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveListElementAdapter extends TypeAdapter<HiveListElement> {
  @override
  final int typeId = 6;

  @override
  HiveListElement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveListElement(
      dt: fields[0] as int,
      main: fields[1] as HiveMainClass,
      weather: (fields[2] as List).cast<HiveWeather>(),
      clouds: fields[3] as HiveClouds,
      wind: fields[4] as HiveWind,
      visibility: fields[5] as int,
      pop: fields[6] as dynamic,
      sys: fields[7] as HiveSys,
      dtTxt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HiveListElement obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.weather)
      ..writeByte(3)
      ..write(obj.clouds)
      ..writeByte(4)
      ..write(obj.wind)
      ..writeByte(5)
      ..write(obj.visibility)
      ..writeByte(6)
      ..write(obj.pop)
      ..writeByte(7)
      ..write(obj.sys)
      ..writeByte(8)
      ..write(obj.dtTxt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveListElementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
