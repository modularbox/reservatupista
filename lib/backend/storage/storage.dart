import 'package:shared_preferences/shared_preferences.dart';

enum TypeStorage {
  passwordUsuario,
  passwordProveedor,
  idUsuario,
  idProveedor,
  tokenUsuario,
  tokenProveedor,
  dineroTotal,
  fotoProveedor,
  fotoUsuario,
  nick,
  idClub
}

extension ExtSharedPreferences on SharedPreferences {
  Storage get passwordUsuario => Storage(TypeStorage.passwordUsuario, this);
  Storage get passwordProveedor => Storage(TypeStorage.passwordProveedor, this);
  Storage get idUsuario => Storage(TypeStorage.idUsuario, this);
  Storage get idProveedor => Storage(TypeStorage.idProveedor, this);
  Storage get tokenUsuario => Storage(TypeStorage.tokenUsuario, this);
  Storage get tokenProveedor => Storage(TypeStorage.tokenProveedor, this);
  Storage get dineroTotal => Storage(TypeStorage.dineroTotal, this);
  Storage get fotoProveedor => Storage(TypeStorage.fotoProveedor, this);
  Storage get nick => Storage(TypeStorage.nick, this);
  Storage get fotoUsuario => Storage(TypeStorage.fotoUsuario, this);
  Storage get idClub => Storage(TypeStorage.idClub, this);
}

class Storage {
  late SharedPreferences getStorage;
  late TypeStorage type;

  factory Storage(TypeStorage newType, SharedPreferences newGetStorage) {
    return Storage._internal(newType, newGetStorage);
  }

  Storage._internal(TypeStorage newType, SharedPreferences newGetStorage) {
    type = newType;
    getStorage = newGetStorage;
  }

  dynamic read() {
    return getStorage.get(type.toString());
  }

  bool exitsValue() {
    return getStorage.get(type.toString()) != null;
  }

  Future<bool> write(dynamic value) async {
    if (value is String) {
      return await getStorage.setString(type.toString(), value);
    } else if (value is int) {
      return await getStorage.setInt(type.toString(), value);
    } else if (value is bool) {
      return await getStorage.setBool(type.toString(), value);
    } else if (value is double) {
      return await getStorage.setDouble(type.toString(), value);
    } else if (value is List<String>) {
      return await getStorage.setStringList(type.toString(), value);
    }
    return false;
  }

  void remove() async {
    if (exitsValue()) {
      await getStorage.remove(type.toString());
    }
  }
}
