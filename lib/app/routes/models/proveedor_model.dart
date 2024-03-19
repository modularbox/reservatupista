import 'dart:convert';

class ProveedorModel {
  String token;
  int idProveedor;
  String tipo;
  String cifNif;
  String direccionFiscal;
  String codigoPostalFiscal;
  String localidadFiscal;
  String provinciaFiscal;
  String comunidadFiscal;
  String codigoIban;
  String certificadoCuenta;
  String nombre;
  String apellidos;
  String fijo;
  String email;
  String lada;
  String telefono;
  String nombreComercial;
  String direccion;
  String codigoPostal;
  String localidad;
  String provincia;
  String comunidad;
  String contrasena;
  String foto;
  DateTime? fechaRegistro;

  ProveedorModel({
    this.token = '',
    this.idProveedor = 0,
    this.tipo = '',
    this.cifNif = '',
    this.direccionFiscal = '',
    this.codigoPostalFiscal = '',
    this.localidadFiscal = '',
    this.provinciaFiscal = '',
    this.comunidadFiscal = '',
    this.codigoIban = '',
    this.certificadoCuenta = '',
    this.nombre = '',
    this.apellidos = '',
    this.fijo = '',
    this.email = '',
    this.lada = '',
    this.telefono = '',
    this.nombreComercial = '',
    this.direccion = '',
    this.codigoPostal = '',
    this.localidad = '',
    this.provincia = '',
    this.comunidad = '',
    this.contrasena = '',
    this.foto = '',
    this.fechaRegistro,
  });

  factory ProveedorModel.fromRawJson(String str) =>
      ProveedorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProveedorModel.fromJson(Map<String, dynamic> json) => ProveedorModel(
        token: json["token"] ?? '',
        idProveedor: json["id_proveedor"] ?? 0,
        tipo: json["tipo"] ?? '',
        cifNif: json["cif_nif"] ?? '',
        direccionFiscal: json["direccion_fiscal"] ?? '',
        codigoPostalFiscal: json["codigo_postal_fiscal"] ?? '',
        localidadFiscal: json["localidad_fiscal"] ?? '',
        provinciaFiscal: json["provincia_fiscal"] ?? '',
        comunidadFiscal: json["comunidad_fiscal"] ?? '',
        codigoIban: json["codigo_iban"] ?? '',
        certificadoCuenta: json["certificado_cuenta"] ?? '',
        nombre: json["nombre"] ?? '',
        apellidos: json["apellidos"] ?? '',
        fijo: json["fijo"] ?? '',
        email: json["email"] ?? '',
        lada: json["lada"] ?? '',
        telefono: json["telefono"] ?? '',
        nombreComercial: json["nombre_comercial"] ?? '',
        direccion: json["direccion"] ?? '',
        codigoPostal: json["codigo_postal"] ?? '',
        localidad: json["localidad"] ?? '',
        provincia: json["provincia"] ?? '',
        comunidad: json["comunidad"] ?? '',
        contrasena: json["contrasena"] ?? '',
        foto: json["foto"] ?? '',
        fechaRegistro: json["fecha_registro"] != null
            ? DateTime.parse(json["fecha_registro"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id_proveedor": idProveedor,
        "tipo": tipo,
        "cif_nif": cifNif,
        "direccion_fiscal": direccionFiscal,
        "codigo_postal_fiscal": codigoPostalFiscal,
        "localidad_fiscal": localidadFiscal,
        "provincia_fiscal": provinciaFiscal,
        "comunidad_fiscal": comunidadFiscal,
        "codigo_iban": codigoIban,
        "certificado_cuenta": certificadoCuenta,
        "nombre": nombre,
        "apellidos": apellidos,
        "fijo": fijo,
        "email": email,
        "lada": lada,
        "telefono": telefono,
        "nombre_comercial": nombreComercial,
        "direccion": direccion,
        "codigo_postal": codigoPostal,
        "localidad": localidad,
        "provincia": provincia,
        "comunidad": comunidad,
        "contrasena": contrasena,
        "foto": foto,
        "fecha_registro": fechaRegistro?.toIso8601String(),
      };
}
