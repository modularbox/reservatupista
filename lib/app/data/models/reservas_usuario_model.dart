import 'dart:convert';

class ReservasUsuarios {
  int plazasReservadasTotales;
  List<ReservaUsuario> usuarios;
  String message;

  ReservasUsuarios({
    required this.plazasReservadasTotales,
    required this.usuarios,
    required this.message,
  });

  factory ReservasUsuarios.fromRawJson(String str) =>
      ReservasUsuarios.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservasUsuarios.fromJson(Map<String, dynamic> json) =>
      ReservasUsuarios(
        plazasReservadasTotales: json["plazas_reservadas_totales"],
        usuarios: json["plazas_reservadas_totales"] == 0
            ? []
            : List<ReservaUsuario>.from(
                json["usuarios"].map((x) => ReservaUsuario.fromJson(x))),
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        "plazas_reservadas_totales": plazasReservadasTotales,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
        "message": message,
      };
}

class ReservaUsuario {
  int idUsuario;
  String nick;
  String nivel;
  int precio;
  String imagen;
  int plazasReservadas;

  ReservaUsuario({
    required this.idUsuario,
    required this.nick,
    this.nivel = '',
    this.precio = 0,
    required this.imagen,
    required this.plazasReservadas,
  });

  factory ReservaUsuario.fromRawJson(String str) =>
      ReservaUsuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservaUsuario.fromJson(Map<String, dynamic> json) => ReservaUsuario(
        idUsuario: json["id_usuario"],
        nick: json["nick"],
        precio: json["precio"] ?? 0,
        nivel: json["nivel"] == null
            ? '0.0'
            : (json["nivel"] == '' ? '0.0' : json["nivel"]),
        imagen: json["foto"] == null ? "" : json['foto'],
        plazasReservadas: json["plazas_reservadas"],
      );

  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "nick": nick,
        "nivel": nivel,
        "foto": imagen,
        "plazas_reservadas": plazasReservadas,
      };
}
