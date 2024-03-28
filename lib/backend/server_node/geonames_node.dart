import 'package:get/get_connect/connect.dart';
import 'package:reservatu_pista/app/routes/models/geonames_model.dart';
import 'datos_server.dart';

class GeoNamesProvider extends GetConnect {
  final url = DatosServer().urlServer;
  // Get Localizacion
  Future<Response> getLocalizacion(String codigoPostal) =>
      get('$url/geonames', headers: {
        "codigopostal": codigoPostal,
      });
}

class GeoNamesNode {
  final provider = GeoNamesProvider();
  Future<GeoNamesModel?> getLocalizacion(String codigoPostal) async {
    final response = await provider.getLocalizacion(codigoPostal);
    if (response.statusCode == 200) {
      return GeoNamesModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
