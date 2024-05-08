// import 'dart:convert';

// ListaTartifas ListaTartifasFromJson(String str) => ListaTartifas.fromJson(json.decode(str));

// String ListaTartifasToJson(ListaTartifas data) => json.encode(data.toJson());

class ListaTartifas {
  List<Tarifa> tarifas;

  ListaTartifas({
    required this.tarifas,
  });

  // factory ListaTartifas.fromJson(Map<String, dynamic> json) => ListaTartifas(
  //     tarifas: List<Tarifa>.from(j.map((x) => Tarifa.toJson())),
  // );

  Map<String, dynamic> toJson() => {
        "tarifas": List<dynamic>.from(tarifas.map((x) => x.toJson())),
      };
}

class Tarifa {
  bool disponible;
  bool luz;
  bool clases;
  String diaSemana;
  String? horaInicio;
  String precioConLuzSocio;
  String precioSinLuzSocio;
  String precioConLuzNoSocio;
  String precioSinLuzNoSocio;
  String fecha;

  Tarifa(
      {this.disponible = false,
      this.luz = false,
      this.clases = false,
      this.horaInicio,
      required this.diaSemana,
      this.precioConLuzSocio = '',
      this.precioSinLuzSocio = '',
      this.precioConLuzNoSocio = '',
      this.precioSinLuzNoSocio = '',
      this.fecha = ''});

  Map<String, dynamic> toJson() {
    return {
      'disponible': disponible,
      'luz': luz,
      'clases': clases,
      'hora_inicio': horaInicio,
      'precioConLuzSocio': precioConLuzSocio,
      'precioSinLuzSocio': precioSinLuzSocio,
      'precioConLuzNoSocio': precioConLuzNoSocio,
      'precioSinLuzNoSocio': precioSinLuzNoSocio,
      'dia_semana': precioSinLuzNoSocio,
    };
  }

  List<dynamic> toList() {
    return [
      disponible,
      clases,
      luz,
      diaSemana,
      horaInicio,
      '',
      precioConLuzSocio.convertPrecio,
      precioSinLuzSocio.convertPrecio,
      precioConLuzNoSocio.convertPrecio,
      precioSinLuzNoSocio.convertPrecio
    ];
  }
}

// Convertir el precio en euros a int
extension ExtConvertPrecio on String {
  int get convertPrecio =>
      int.parse('${split(' ')[0].split('.')[0]}${split(' ')[0].split('.')[1]}');
}
