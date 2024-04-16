import 'package:shared_preferences/shared_preferences.dart';

enum TypeStorage {
  passwordUsuario,
  passwordProveedor,
  idUsuario,
  idProveedor,
  token,
  dineroTotal,
  emailUsuario,
  emailProveedor,
  foto,
  idClub,
  nick
}

extension ExtSharedPreferences on SharedPreferences {
  Storage get passwordUsuario => Storage(TypeStorage.passwordUsuario, this);
  Storage get passwordProveedor => Storage(TypeStorage.passwordProveedor, this);
  Storage get idUsuario => Storage(TypeStorage.idUsuario, this);
  Storage get idProveedor => Storage(TypeStorage.idProveedor, this);
  Storage get token => Storage(TypeStorage.token, this);
  Storage get dineroTotal => Storage(TypeStorage.dineroTotal, this);
  Storage get foto => Storage(TypeStorage.foto, this);
  Storage get emailProveedor => Storage(TypeStorage.emailProveedor, this);
  Storage get emailUsuario => Storage(TypeStorage.emailUsuario, this);
  Storage get idClub => Storage(TypeStorage.idClub, this);
  Storage get nick => Storage(TypeStorage.nick, this);
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
    print('write');
    print(value);
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
