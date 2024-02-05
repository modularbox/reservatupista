import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '../../../../utils/colores.dart';
import './olvide_contrasena_c.dart';

class OlvideContrasenaPage extends GetView<OlvideContrasenaController> {
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
        title: 'Olvidé la contraseña',
        isTitleBack: true,
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              20.0.sh,
              Form(key: controller.formKey0, child: _buildInput()),
              20.0.sh,
              Obx(() => controller.stateEmail.value
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        '''Le enviaremos un email para restablecer la contraseña.
Por favor si pasado unos minutos no lo recibe,revise la carpeta de spam de su correo.
''',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 20),
                      ),
                    )
                  : 0.0.empty),
              20.0.sh,
              Center(
                child: ElevatedButton(
                    onPressed: controller.resendSendEmail,
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(
                            Size(Get.width * 0.45, 0))),
                    child: const Text("Recuperar")),
              )
            ]),
          ),
        ));
  }

  Widget _buildInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        onChanged: controller.restartValidate,
        maxLength: 40,
        decoration: InputDecoration(
          labelText: 'Email',
          counterText: '',
          prefixIcon: const Icon(Icons.email),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colores().usuario.primary)),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor, ingresa tu email.';
          }
          return null;
        },
      ),
    );
  }
}
