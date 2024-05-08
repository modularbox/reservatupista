import 'dart:ui';

abstract final class Colores {
  static final ColoresProveedor proveedor = ColoresProveedor();
  static final ColoresUsuario usuario = ColoresUsuario();
  static const Color rojo = Color(0xFFF77066);
  static const Color orange = Color(0xFFFFA500);
  static const Color grisClaro = Color.fromRGBO(220, 220, 220, 1.0);
  static const Color sucessGeneral = Color(0xFF46EF98);
}

class ColoresProveedor {
  final Color primary = const Color(0xFF46EF98);
  final Color primary160 = const Color.fromARGB(160, 70, 239, 152);
  final Color primary69 = const Color.fromARGB(69, 70, 239, 152);
}

class ColoresUsuario {
  final Color primary = Color.fromRGBO(43, 120, 220, 1);
  final Color primary160 = const Color.fromARGB(160, 43, 120, 220);
  final Color primary69 = const Color.fromARGB(69, 43, 120, 220);
}
