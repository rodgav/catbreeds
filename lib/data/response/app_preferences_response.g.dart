// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_preferences_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppPreferencesResponseAdapter
    extends TypeAdapter<AppPreferencesResponse> {
  @override
  final int typeId = 1;

  @override
  AppPreferencesResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppPreferencesResponse(
      appLocale: fields[0] == null
          ? AppLocaleResponse.es
          : fields[0] as AppLocaleResponse,
      darkMode: fields[1] == null ? true : fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AppPreferencesResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.appLocale)
      ..writeByte(1)
      ..write(obj.darkMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppPreferencesResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppLocaleResponseAdapter extends TypeAdapter<AppLocaleResponse> {
  @override
  final int typeId = 2;

  @override
  AppLocaleResponse read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AppLocaleResponse.es;
      case 1:
        return AppLocaleResponse.en;
      default:
        return AppLocaleResponse.es;
    }
  }

  @override
  void write(BinaryWriter writer, AppLocaleResponse obj) {
    switch (obj) {
      case AppLocaleResponse.es:
        writer.writeByte(0);
        break;
      case AppLocaleResponse.en:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppLocaleResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
