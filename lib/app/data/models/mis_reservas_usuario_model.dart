import 'dart:convert';

import 'package:reservatu_pista/app/data/models/reservas_usuario_model.dart';

class MisReservasUsuarioModel {
  final int idReserva;
  final int dineroPagado;
  final int idUsuario;
  final int idPista;
  final String horaInicio;
  final DateTime fechaReserva;
  final String referencia;
  final String deporte;
  final int numPista;
  final String nombrePatrocinador;
  final int capacidad;
  final String nombre;
  final String foto;
  final String horaFin;
  final String localidad;
  final String tipoReserva;
  // final String luz;
  final String iluminacion;
  final int automatizada;
  final String pista;
  final int duracionPartida;
  ReservasUsuarios? reservasUsuarios;

  MisReservasUsuarioModel(
      {required this.idReserva,
      required this.dineroPagado,
      required this.idUsuario,
      required this.idPista,
      required this.horaInicio,
      required this.fechaReserva,
      required this.referencia,
      required this.deporte,
      required this.numPista,
      required this.nombrePatrocinador,
      required this.capacidad,
      required this.nombre,
      required this.foto,
      required this.localidad,
      // required this.luz,
      required this.iluminacion,
      required this.automatizada,
      required this.pista,
      required this.horaFin,
      required this.duracionPartida,
      required this.tipoReserva,
      this.reservasUsuarios});

  factory MisReservasUsuarioModel.fromRawJson(String str) =>
      MisReservasUsuarioModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MisReservasUsuarioModel.fromJson(Map<String, dynamic> json) =>
      MisReservasUsuarioModel(
        idReserva: json["id_reserva"],
        dineroPagado: json["dinero_pagado"],
        idUsuario: json["id_usuario"],
        idPista: json["id_pista"],
        horaInicio: json["hora_inicio"],
        fechaReserva:
            DateTime.parse(json["fecha_reserva"]).add(const Duration(days: 1)),
        referencia: json["referencia"],
        deporte: json["deporte"],
        numPista: json["num_pista"],
        nombrePatrocinador: json["nombre_patrocinador"],
        capacidad: json["capacidad"],
        nombre: json["nombre"],
        foto: json["foto"],
        localidad: json["localidad"],
        // luz: json['iluminacion'],
        iluminacion: json['iluminacion'],
        automatizada: json['automatizada'],
        pista: json['pista'],
        horaFin: json['hora_fin'],
        duracionPartida: json['duracion_partida'],
        tipoReserva: json['tipo_reserva'],
      );

  Map<String, dynamic> toJson() => {
        "id_reserva": idReserva,
        "dinero_pagado": dineroPagado,
        "id_usuario": idUsuario,
        "id_pista": idPista,
        "hora_inicio": horaInicio,
        "fecha_reserva": fechaReserva,
        "referencia": referencia,
        "deporte": deporte,
        "num_pista": numPista,
        "nombre_patrocinador": nombrePatrocinador,
        "capacidad": capacidad,
        "nombre": nombre,
        "foto": foto,
        "tipo_reserva": tipoReserva,
        // "localidad": localidad,
        // "luz": luz,
        // "iluminacion": iluminacion,
        // "automatizada": automatizada,
        // "pista": pista,
        // "horaFin": horaFin,
        // "duracionPartida": duracionPartida,
      };
}
