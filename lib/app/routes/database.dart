import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:reservatu_pista/backend/server_node.dart/datos_server.dart';
import 'package:reservatu_pista/backend/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../backend/server_node.dart/proveedor_node.dart';
import '../../backend/server_node.dart/usuario_node.dart';
import '../../utils/state_getx/state_mixin_demo.dart';
import 'models/datos_reservas_pista.dart';
import 'models/proveedor_model.dart';
import 'models/usuario_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DatabaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DatabaseController>(DatabaseController());
  }
}

class DatabaseController extends GetxController {
  // Iniciarlizar la db
  late SharedPreferences storage;
  String version = '2.1.6';
  Rx<String> imageServer = ''.obs;
  late DatosReservaPista datosReserva;
  UsuarioModel? datosUsuario;
  ProveedorModel? datosProveedor;
  RxDouble money = 0.0.obs;
  // late Storage storageIdUsuario;
  // late Storage storageIdProveedor;
  // late Storage storageTokenUsuario;
  // late Storage storageTokenProveedor;
  // int dineroTotal = 0;

  final _dineroTotal = 0.obs;
  get dineroTotal => _dineroTotal.value;
  set dineroTotal(value) => _dineroTotal.value = value;

  final _dineroTotalEuros = '0'.obs;
  get dineroTotalEuros => _dineroTotalEuros.value;
  set dineroTotalEuros(value) => _dineroTotalEuros.value = value;

  StateRx<UsuarioModel?> datosPerfilUsuario = StateRx(Rx<UsuarioModel?>(null));
  // StateRx<UsuarioModel?> datosPerfilUsuario = StateRx(Rx<UsuarioModel?>(null));

  //alvaro
  final _idUsuario = 0.0.obs;
  get idUsuario => _idUsuario.value;
  set idUsuario(value) => _idUsuario.value = value;
  //void setIdUsuario(int value) => _idUsuario.value = value;
  @override
  void onInit() async {
    super.onInit();
    // Muestra el estado de carga
    // datosPerfilUsuario.changeStatus(RxStatusDemo.loading());
    // getUserId();
    try {
      datosReserva = datosReservaPistaFromJson(jsonEncode(
          {"clubsFavoritos": [], "tiempoReserva": 7, "reservas": generate()}));

      // // final getStorage = await SharedPreferences.getInstance();
      // // // Guardar archivos temporales
      // // storageIdUsuario = Storage(TypeStorage.idUsuario, getStorage);
      // await getVariablesGuardadas();
      // await getMoney();
      storage = await SharedPreferences.getInstance();
    } catch (e) {
      print(e);
    }
    print("sd");
  }

  Future<void> getVariablesGuardadas() async {
    // storageIdUsuario = Storage(TypeStorage.idUsuario, getStorage);
    // idUsuario = storageIdUsuario.read();
    // storageIdProveedor = Storage(TypeStorage.idProveedor, getStorage);
    // storageTokenUsuario = Storage(TypeStorage.tokenUsuario, getStorage);
    // storageTokenProveedor = Storage(TypeStorage.tokenProveedor, getStorage);
  }
  Future<void> getImageUsuario(String? changeImage) async {
    try {
      if (changeImage != null) {
        imageServer.value = UsuarioNode().getImageUsuarioNode(changeImage);
      } else {
        if (imageServer.value == '') {
          final storage = await SharedPreferences.getInstance();
          final String imageUsuario = storage.fotoUsuario.read();
          imageServer.value = UsuarioNode().getImageUsuarioNode(imageUsuario);
          print('imageuUSaurio: $imageUsuario');
        }
      }
    } catch (e) {}
  }

  Future<bool> getDatosUsuario() async {
    try {
      final result = await UsuarioNode().getUsuarioNode('1');
      if (result is UsuarioModel) {
        imageServer.value = UsuarioNode().getImageUsuarioNode(result.foto);
        datosUsuario = result;
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> getDatosUsuarioId() async {
    // final getStorage = await SharedPreferences.getInstance();

    // final storageIdUsuario = Storage(TypeStorage.idUsuario, getStorage);
    try {
      final storage = await SharedPreferences.getInstance();
      final List<TypeDatosServer> listTypes = [
        TypeDatosServer.apellidos,
        TypeDatosServer.nombre,
        TypeDatosServer.nick,
        TypeDatosServer.nivel,
        TypeDatosServer.foto
      ];

      final result = await UsuarioNode().getUsuario(
          storage.idUsuario.read(), storage.tokenUsuario.read(), listTypes);
      if (result is UsuarioModel) {
        imageServer.value = UsuarioNode().getImageUsuarioNode(result.foto);
        datosPerfilUsuario.change(result, RxStatusDemo.success());
        datosUsuario = result;
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  /*Future<bool> getDatosUsuarioMoney() async {
    final getStorage = await SharedPreferences.getInstance();
    final storageIdUsuario = Storage(TypeStorage.idUsuario, getStorage);

    try {
      final List<TypeDatosServer> listTypes = [
        TypeDatosServer.dinero_total,
        TypeDatosServer.nombre
      ];

      final result = await UsuarioNode().getUsuario(
          storageIdUsuario.read(), storageTokenUsuario.read(), listTypes);
      print('result: ${result!.dineroTotal}');
      if (result is UsuarioModel) {
        imageServer.value = UsuarioNode().getImageUsuarioNode(result.foto);
        datosPerfilUsuario.change(result, RxStatusDemo.success());
        datosUsuario = result;
        dineroTotal = result.dineroTotal;
        dineroTotalEuros = 2;
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }*/

  Future<void> getMoney() async {
    try {
      final storage = await SharedPreferences.getInstance();
      final List<TypeDatosServer> listTypes = [
        TypeDatosServer.dinero_total,
      ];

      final result = await UsuarioNode().getUsuario(
          storage.idUsuario.read(), storage.tokenUsuario.read(), listTypes);

      if (result is UsuarioModel) {
        dineroTotal = result.dineroTotal;
        dineroTotalEuros = ((dineroTotal) / 100).toStringAsFixed(2);
        print('dineroTotalEuros $dineroTotalEuros');
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      }
    } catch (e, stack) {
      print('e  $e');
    }
  }

  void getUserId() async {
    final getStorage = await SharedPreferences.getInstance();

    idUsuario = Storage(TypeStorage.idUsuario, getStorage).read();
  }

  void setDatosUsuario(UsuarioModel result) {
    imageServer.value = UsuarioNode().getImageUsuarioNode(result.foto);
    datosUsuario = result;
  }

  void setDatosProveedor(ProveedorModel result) {
    imageServer.value = ProveedorNode().getImageProveedorNode(result.foto);
    datosProveedor = result;
  }

  Future<bool> getDatosProveedor() async {
    try {
      final result = await ProveedorNode().getProveedorNode('1');
      if (result is ProveedorModel) {
        imageServer.value = ProveedorNode().getImageProveedorNode(result.foto);
        datosProveedor = result;

        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  //alvaro
  Future<bool> subtractUserMoney(int idUsuario, int money) async {
    try {
      var response = await http.post(
          Uri.parse('https://api.reservatupista.com/usuario/restar_dinero'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'id_usuario': idUsuario, 'cantidad': money * 100}));
      return true;
    } catch (error) {
      print('errorrrrr: $error');
      return false;
    }
  }

  Future<bool> reservarPista(int idUsuario, double money, DateTime fecha,
      String hora_inicio, String id_pista, int plazas_a_reservar) async {
    try {
      var response = await http.post(
          Uri.parse('https://api.reservatupista.com/usuario/reservar_pista'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            'id_pista': id_pista,
            'id_usuario': idUsuario,
            'cantidad': money * 100,
            'fecha': fecha.toString(),
            'hora_inicio': hora_inicio,
            'plazas_a_reservar': plazas_a_reservar
          }));
      print('moooney ${money}');
      print('fecha.toString() ${fecha.toString()}');
      print('hora_iniciohora_inicio ${hora_inicio}');
      print('response.bodyresponse.body ${response.body}');
      return true;
    } catch (error) {
      print('error reservarPista $error');
      return false;
    }
  }

  Future<http.Response> obtenerPlazasPista(
      int idUsuario, DateTime fecha, String hora_inicio, int id_pista) async {
    try {
      print('hora_inicio ${hora_inicio}');
      http.Response response = await http.post(
          Uri.parse(
              'https://api.reservatupista.com/usuario/obtener_plazas_libres'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            'id_pista': id_pista,
            'id_usuario': idUsuario,
            'fecha': fecha.toString(),
            'hora_inicio': hora_inicio,
          }));
      print('responseeee $response');
      return response;
    } catch (error) {
      print('eeeeeeeeerrror: $error');
      rethrow;
    }
  }

  Future<String> obtenerPrecioPista(
      String dia, String hora_inicio, String id_pista) async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.reservatupista.com/usuario/obtener_precio_pista?dia=$dia&hora=$hora_inicio&id_pista=$id_pista'));
      return 'true';
    } catch (error) {
      print('eeeeeeeeerrrror: $error');
      return 'false';
    }
  }

  Future<String> obtenerLocalidades() async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.reservatupista.com/usuario/obtener_localidades'));
      return response.body.toString();
    } catch (error) {
      print('eeeeeeeeerrrrooor: $error');
      rethrow;
    }
  }

  Future<String> obtenerClubes(String cod_postal) async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.reservatupista.com/usuario/obtener_clubes?cod_postal=$cod_postal'));
      return response.body.toString();
    } catch (error) {
      print('eeeeeeeeerrrrrrrror: $error');
      rethrow;
    }
  }

  Future<String> obtenerDeportes(String id_club) async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.reservatupista.com/usuario/obtener_deportes?id_club=$id_club'));
      return response.body.toString();
    } catch (error) {
      print('eeeeeeeeerrrrrrrrrrrrrrrrror: $error');
      rethrow;
    }
  }

  Future<String> obtenerPistas(String id_club, String deporte) async {
    try {
      print('id_club $id_club');
      print('deporte $deporte');
      var response = await http.get(Uri.parse(
          'https://api.reservatupista.com/usuario/obtener_pistas?id_club=$id_club&deporte=$deporte'));
      return response.body.toString();
    } catch (error) {
      print('eeeeerror: $error');
      rethrow;
    }
  }

  Future<String> obtenerDatosPista(String id_pista) async {
    try {
      print('iddddd_pista ${id_pista}');
      var response = await http.get(Uri.parse(
          'https://api.reservatupista.com/usuario/obtener_datos_pista?id_pista=$id_pista'));
      print('responseeeeeeeeeeeeeeeeeei ${response.body}');
      return response.body.toString();
    } catch (error) {
      print('eeeeerrorrrrr: $error');
      rethrow;
    }
  }

  Future<String> obtenerHorariosPistas(int id_pista, DateTime fecha) async {
    try {
      // Generar la lista de nombres cortos de los días de la semana
      // String nuevaFecha = DateFormat('yyyy-MM-dd').format(dia);
      // print('nuevaFecha $nuevaFecha');
      print('idd_pista $id_pista');
      print('fecha.diaSemana ${fecha.diaSemana}');
      var response = await http.get(Uri.parse(
          'https://api.reservatupista.com/usuario/obtener_horarios_pistas/$id_pista/?dia_semana=${fecha.diaSemana}&fecha=${fecha}'));
      print('response.body.toString() ${response.body.toString()}');
      print(' ${response.body}');
      print('lleeeeeeeeeega');

      return response.body.toString();
    } catch (error, stack) {
      print('stackkkkkkkkkkkkkk $stack');
      print('errorrrrrrrrrrrrr $error');
      rethrow;
    }
  }

  Future<String> existeReservaPendiente(
      int id_pista, DateTime fecha, String horaInicio) async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.reservatupista.com/usuario/obtener_reservas_pendientes/?id_pista=${id_pista}&fecha=${fecha}&hora_inicio=${horaInicio}'));
      print('response.body.toString() ${response.body.toString()}');
      print('${response.body}');

      return response.body.toString();
    } catch (error, stack) {
      print('stackkkkkkkkkkkkkkkk $stack');
      print('errorrrrrrrrrrrrrrr $error');
      rethrow;
    }
  }
/*
Future<String> obtenerHorariosPista(String dia, String id_pista) async {
  try {
    var response = await http.post(
        Uri.parse(
            'https://api.reservatupista.com/usuario/obtener_horarios_pista'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'dia': dia, 'id_pista': id_pista}));
    return response.body.toString();
  } catch (error) {
    return '';
  }
}*/

  List generate() {
    final localidades = [
      'Belvis de Monroy',
      'Riolobos',
      'Casar de Palomaro',
      'Cheles',
      'Helechosa de los Montes',
      'Orellana La Vieja',
      'Aldea del Cano',
      'Tayuela',
      'Tayuela Club',
    ];

    final clubs = [
      'Club 1',
      'Club 2',
      'Club 3',
      'Club 4',
      'Club 5',
      'Club 6',
      'Club 7',
      'Club 8',
      'Club 9',
    ];

    List<Map> mapa = [];
    for (var l = 0; l < 9; l++) {
      final mapj = {};
      mapj['localidad'] = localidades[l];
      // List listCompleta = [];
      // for (var i = 0; i < clubs.length; i++) {
      List listaClubs = [];
      for (var j = 0; j < l + 1; j++) {
        listaClubs.add({
          'name': clubs[j] + ' ${localidades[l]}',
          'favorito': false,
          'deportes': getDeportes(l + 1)
        });
      }
      mapj['clubs'] = listaClubs;
      mapa.add(mapj);
      // }
    }
    return mapa;
    // printInfo(info: jsonEncode(mapa).toString());
  }

  List getDeportes(int index) {
    final deportes = [
      '🎾 Padel',
      '🎾 Tenis',
      '🏸 Badminton',
      '🏊‍♀️ P. Climatizada',
      '🏊‍♀️ Piscina',
      '🏀 Baloncesto',
      '⚽ Futbol sala',
      '⚽ Futbol 7',
      '⚽ Futbol 11',
      '🥍 Pickleball',
      '🏸 Squash',
      '🏓 Tenis de mesa',
      '🏓 Fronton',
      '⚽ Balomano',
      '🏉 Rugby',
      '🥅 Multideporte',
    ];
    final newLista = [];
    final RAD = Random();
    final id = RAD.nextInt(16);
    for (var i = 0; i < index; i++) {
      newLista.add({
        'name': deportes[i],
        'semana': List.generate(7, (index) => getSemana(index))
      });
    }
    return newLista;
  }

  Map getSemana(int index) {
    final pistas = [
      'Reservatupista',
      'Modularbox',
      'Miragredos',
      'Fibrabox',
    ];
    // const image = 'logo_reservatupista.png';
    final images = [
      'logo_reservatupista_title.jpg',
      'logo_modularbox.jpg',
      'logo_miragredos.jpg',
      'logo_fibrabox.jpg'
    ];
    List listacom = [];
    for (var j = 0; j < pistas.length; j++) {
      // pistas[j]
      final random = Random();
      final horariosAleatorio = [
        {"horario": "07:30", "estatus": "reservada"},
        {"horario": "09:00", "estatus": "reservada"},
        {"horario": "10:30", "estatus": "reservada"},
        {"horario": "12:00", "estatus": "reservada"},
        {"horario": "13:30", "estatus": "ocupada"},
        {"horario": "15:00", "estatus": "ocupada"},
        {"horario": "16:30", "estatus": "reservada"},
        {"horario": "18:00", "estatus": "reservada"},
        {"horario": "19:30", "estatus": "reservada"},
        {"horario": "21:00", "estatus": "reservada"},
        {"horario": "22:30", "estatus": "reservada"}
      ];
      final estatus = ['desocupada', 'reservada', 'ocupada', 'abierta'];
      for (var i = 0; i < horariosAleatorio.length; i++) {
        int indiceAleatorio = random.nextInt(4);
        if (index == 0 && pistas[j] == "Modularbox") {
          horariosAleatorio[i]['estatus'] = 'reservada';
        } else {
          horariosAleatorio[i]['estatus'] = estatus[indiceAleatorio];
        }
      }
      listacom.add({
        'name': pistas[j],
        'image': images[j],
        'horarios': horariosAleatorio
      });
    }
    return {'pistas': listacom};
  }
}

extension DateTimeExt on DateTime {
  String get diaSemana => ['L', 'M', 'X', 'J', 'V', 'S', 'D'][weekday - 1];
}
