import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:get/get.dart';

class PruebasController extends GetxController {
  void pruebas() async {
    // final String locationPurposeString =
    //     await rootBundle.loadString('Info.plist');
    final result = await showOkAlertDialog(
      context: Get.context!,
      title: '"ReservatuPista" Me gustaría saber tu ubicación',
      message:
          '''La aplicación necesita acceder a tu ubicación para proporcionarte servicios basados en la ubicación, 
      como encontrar pistas cercanas, obtener direcciones y mejorar tu experiencia de usuario. 
      Tu ubicación se utilizará únicamente dentro de la aplicación y no será compartida con terceros sin tu consentimiento. 
      Al permitir el acceso a tu ubicación, podrás disfrutar plenamente de todas las funciones de la aplicación.''',
      barrierDismissible: false,
    );
    // print(locationPurposeString);
    // Parse the Info.plist file to extract the location purpose string
    // This might involve using regular expressions or XML parsers, depending on the format of your Info.plist file
    // For simplicity, let's assume the purpose string is stored in a specific XML node
    // Extract the purpose string and return it
    // For example:
    // <key>NSLocationWhenInUseUsageDescription</key>
    // <string>This app needs access to your location to provide location-based services.</string>
    // You would need to extract the string between <string> and </string>
    // return extractedLocationPurposeString;
  }
}
