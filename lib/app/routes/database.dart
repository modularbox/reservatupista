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

class DatabaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DatabaseController>(DatabaseController());
  }
}

class DatabaseController extends GetxController {
  String version = '2.1.6';
  Rx<String> imageServer = ''.obs;
  late DatosReservaPista datosReserva;
  UsuarioModel? datosUsuario;
  ProveedorModel? datosProveedor;
  RxDouble money = 0.0.obs;
  late Storage storageIdUsuario;
  late Storage storageIdProveedor;
  late Storage storageTokenUsuario;
  late Storage storageTokenProveedor;
  // int dineroTotal = 0;

  final _dineroTotal = 0.obs;
  get dineroTotal => _dineroTotal.value;
  set dineroTotal(value) => _dineroTotal.value = value;

  StateRx<UsuarioModel?> datosPerfilUsuario = StateRx(Rx<UsuarioModel?>(null));
  // StateRx<UsuarioModel?> datosPerfilUsuario = StateRx(Rx<UsuarioModel?>(null));

  @override
  void onInit() async {
    super.onInit();
    // Muestra el estado de carga
    datosPerfilUsuario.changeStatus(RxStatusDemo.loading());
    getMoney();
    try {
      datosReserva = datosReservaPistaFromJson(jsonEncode(
          {"clubsFavoritos": [], "tiempoReserva": 7, "reservas": generate()}));

      // final getStorage = await SharedPreferences.getInstance();
      // // Guardar archivos temporales
      // storageIdUsuario = Storage(TypeStorage.idUsuario, getStorage);
      getVariablesGuardadas();
    } catch (e) {
      print(e);
    }
    print("sd");
  }

  void getVariablesGuardadas() async {
    final getStorage = await SharedPreferences.getInstance();
    storageIdUsuario = Storage(TypeStorage.idUsuario, getStorage);
    storageIdProveedor = Storage(TypeStorage.idProveedor, getStorage);
    storageTokenUsuario = Storage(TypeStorage.tokenUsuario, getStorage);
    storageTokenProveedor = Storage(TypeStorage.tokenProveedor, getStorage);
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
    final getStorage = await SharedPreferences.getInstance();
    final storageIdUsuario = Storage(TypeStorage.idUsuario, getStorage);
    try {
      final List<TypeDatosServer> listTypes = [
        TypeDatosServer.apellidos,
        TypeDatosServer.nombre,
        TypeDatosServer.nick,
        TypeDatosServer.nivel,
        TypeDatosServer.foto
      ];

      final result = await UsuarioNode().getUsuario(
          storageIdUsuario.read(), storageTokenUsuario.read(), listTypes);
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

  Future<bool> getDatosUsuarioMoney() async {
    final getStorage = await SharedPreferences.getInstance();
    final storageIdUsuario = Storage(TypeStorage.idUsuario, getStorage);
    try {
      final List<TypeDatosServer> listTypes = [
        TypeDatosServer.dinero_total,
        TypeDatosServer.nombre
      ];

      final result = await UsuarioNode().getUsuario(
          storageIdUsuario.read(), storageTokenUsuario.read(), listTypes);
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

  void getMoney() async {
    final getStorage = await SharedPreferences.getInstance();
    print(Storage(TypeStorage.dineroTotal, getStorage).read());
    dineroTotal = Storage(TypeStorage.dineroTotal, getStorage).read();
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
}

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
    listacom.add(
        {'name': pistas[j], 'image': images[j], 'horarios': horariosAleatorio});
  }
  return {'pistas': listacom};
}
