import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class InicioProveedorController extends GetxController {
  int carouselCurrentIndex = 1;

  /// Initialization and disposal methods.
  final carouselController = CarouselController();
  final carouselOfertasController = CarouselController();
}
