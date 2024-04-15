extension PrintExt on String {
  // Colores de texto
  void azul() => print('\x1B[34mTexto en azul\x1B'); // Azul
  void rojo() => print('\x1B [33m ddsd \x1B [0m'); // Rojo
  void verde() => print('\x1B[32mTexto en verde\x1B[0m'); // Verde
  void amarillo() => print('\x1B[33mTexto en amarillo\x1B[0m'); // Amarillo
  void magenta() => print('\x1B[35mTexto en magenta\x1B[0m'); // Magenta
  void cian() => print('\x1B[36mTexto en cian\x1B[0m'); // Cian
  void blanco() => print('\x1B[37mTexto en blanco\x1B[0m'); // Blanco

  // Colores de fondo
  void fondoRojo() =>
      print('\x1B[41mTexto con fondo rojo\x1B[0m'); // Fondo rojo
  void fondoVerde() =>
      print('\x1B[42mTexto con fondo verde\x1B[0m'); // Fondo verde
  void fondoAmarillo() =>
      print('\x1B[43mTexto con fondo amarillo\x1B[0m'); // Fondo amarillo
  void fondoAzul() =>
      print('\x1B[44mTexto con fondo azul\x1B[0m'); // Fondo azul
  void fondoMagenta() =>
      print('\x1B[45mTexto con fondo magenta\x1B[0m'); // Fondo magenta
  void fondoCian() =>
      print('\x1B[46mTexto con fondo cian\x1B[0m'); // Fondo cian
  void fondoBlanco() =>
      print('\x1B[47mTexto con fondo blanco\x1B[0m'); // Fondo blanco

  // Estilos de texto
  void negrita() => print('\x1B[1mTexto en negrita\x1B[0m'); // Negrita
  void subrallado() => print('\x1B[4mTexto subrayado\x1B[0m'); // Subrayado
}
