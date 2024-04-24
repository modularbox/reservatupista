import '/components/nav_bar_usuario/nav_bar_usuario_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'monedero_p.dart' show MonederoVirtualWidget;
import 'package:flutter/material.dart';

enum TypeHistorial { reserva, tranferencia, all }

class MonederoVirtualModel extends FlutterFlowModel<MonederoVirtualWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBarUsuario component.
  late NavBarUsuarioModel navBarUsuarioModel;
  bool isFiltrar = false;
  late TypeHistorial type;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    type = TypeHistorial.all;
    navBarUsuarioModel = createModel(context, () => NavBarUsuarioModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navBarUsuarioModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
