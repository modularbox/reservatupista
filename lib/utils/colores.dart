import 'dart:ui';

abstract final class Colores {
  static final ColoresProveedor proveedor = ColoresProveedor();
  static final ColoresUsuario usuario = ColoresUsuario();
  static const Color rojo = Color(0xFFF77066);
  static const Color verde = Color.fromARGB(255, 48, 234, 138);
  static const Color azul = Color.fromRGBO(43, 120, 220, 1);
  static const Color orange = Color(0xFFFFA500);
  static const Color grisClaro = Color.fromRGBO(220, 220, 220, 1.0);
  static const Color sucessGeneral = Color(0xFF46EF98);
}

class ColoresProveedor {
  final Color primary = const Color.fromARGB(255, 48, 234, 138);
  final Color primary160 = const Color.fromARGB(160, 48, 234, 138);
  final Color primary69 = const Color.fromARGB(69, 48, 234, 138);
  final Color primary40 = const Color.fromARGB(40, 48, 234, 138);
}

class ColoresUsuario {
  final Color primary = const Color.fromRGBO(43, 120, 220, 1);
  final Color primary160 = const Color.fromARGB(160, 43, 120, 220);
  final Color primary200 = const Color.fromARGB(200, 43, 120, 220);
  final Color primary69 = const Color.fromARGB(69, 43, 120, 220);
  final Color background = const Color(0xFFF1F4F8);
}
