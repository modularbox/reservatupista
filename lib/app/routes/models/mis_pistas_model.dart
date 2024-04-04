import 'dart:convert';

class MisPistas {
  List<MiPista> misPistas;

  MisPistas({
    required this.misPistas,
  });

  factory MisPistas.fromRawJson(String str) =>
      MisPistas.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MisPistas.fromJson(Map<String, dynamic> json) => MisPistas(
        misPistas: List<MiPista>.from(
            json["mis_pistas"].map((x) => MiPista.fromJson(x))),
      );
  factory MisPistas.fromList(List<dynamic> list) => MisPistas(
        misPistas: List<MiPista>.from(list.map((x) => MiPista.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mis_pistas": List<dynamic>.from(misPistas.map((x) => x.toJson())),
      };
}

class MiPista {
  int idPista;
  String nombrePatrocinador;
  int numPista;
  String deporte;
  String imagenPatrocinador;
  int total;
  int totalLibre;
  int totalAbierta;
  int totalCerrada;

  MiPista({
    required this.idPista,
    required this.nombrePatrocinador,
    required this.numPista,
    required this.deporte,
    required this.imagenPatrocinador,
    required this.total,
    required this.totalLibre,
    required this.totalAbierta,
    required this.totalCerrada,
  });

  factory MiPista.fromRawJson(String str) => MiPista.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MiPista.fromJson(Map<String, dynamic> json) => MiPista(
        idPista: json["id_pista"],
        nombrePatrocinador: json["nombre_patrocinador"],
        numPista: json["num_pista"],
        deporte: json["deporte"],
        imagenPatrocinador: json["imagen_patrocinador"],
        total: json["total"],
        totalLibre: json['totalLibre'] ?? 0,
        totalAbierta: json['totalAbierta'] ?? 0,
        totalCerrada: json['totalCerrada'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id_pista": idPista,
        "nombre_patrocinador": nombrePatrocinador,
        "num_pista": numPista,
        "deporte": deporte,
        "imagen_patrocinador": imagenPatrocinador,
        "total": total,
        "totalLibre": totalLibre,
        "totalAbierta": totalAbierta,
        "totalCerrada": totalCerrada,
      };
}
