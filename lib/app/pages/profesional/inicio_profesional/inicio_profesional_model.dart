import 'package:carousel_slider/carousel_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'inicio_profesional_widget.dart' show InicioProfesionalWidget;
import 'package:flutter/material.dart';

class InicioModel extends FlutterFlowModel<InicioProfesionalWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.
  CarouselController carouselController = CarouselController();
  CarouselController carouselOfertasController = CarouselController();

  int carouselCurrentIndex = 1;

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}