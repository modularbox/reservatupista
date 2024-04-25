import '/components/app_bar_profesional/app_bar_profesional_widget.dart';
import '/components/nav_bar_profesional/nav_bar_profesional_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'banco_virtual_widget.dart' show BancoVirtualWidget;
import 'package:flutter/material.dart';

enum TypeHistorial { reserva, tranferencia, all }

class BancoVirtualModel extends FlutterFlowModel<BancoVirtualWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBarProfesional component.
  late NavBarProfesionalModel navBarProfesionalModel;
  // Model for AppBarProfesional component.
  late AppBarProfesionalModel appBarProfesionalModel;

  bool isFiltrar = false;
  late TypeHistorial type;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    type = TypeHistorial.all;
    navBarProfesionalModel =
        createModel(context, () => NavBarProfesionalModel());
    appBarProfesionalModel =
        createModel(context, () => AppBarProfesionalModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navBarProfesionalModel.dispose();
    appBarProfesionalModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
