import 'dart:core';
import 'dart:ffi';

class Socio {
  String? _nombre;
  String? _nick;
  Double? _nivel;
  String? _dni;
  String? _direccion;
  int? _partidasJugadas;
  String? _posicion;
  String? _horario;
  String? _email;
  String? _telefono;
  String? _fechaAlta;

  Socio(
      String nombre,
      String nick,
      String dni,
      Double nivel,
      String direccion,
      int partidasJugadas,
      String posicion,
      String horario,
      String email,
      String telefono,
      String fechaAlta) {
    _nombre = nombre;
    _nick = nick;
    _dni = nick;
    _nivel = nivel;
    _direccion = direccion;
    _partidasJugadas = partidasJugadas;
    _posicion = posicion;
    _horario = horario;
    _email = email;
    _telefono = telefono;
    _fechaAlta = fechaAlta;
  }
}
