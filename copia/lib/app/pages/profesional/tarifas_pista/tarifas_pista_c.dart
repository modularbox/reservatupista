import 'package:get/get.dart';
import '../../../../app_state.dart';

class TarifasPistaController extends GetxController {
  List<List<Tarifa>> listTarifas = [];
  RxInt indexDias = 0.obs;
  // Actualizar toda la tabla los campos de activado y desactivado
  Rx<List<bool>> listActive = Rx<List<bool>>([]);
  RxBool changeAllActive = false.obs;
  // Actualizar las fila de clases
  List<RxBool> listClase = [];
  RxBool changeAllClase = false.obs;
  // Actualizar las fila de luz
  List<RxBool> listLuz = [];
  RxBool changeAllLuz = false.obs;
  // Clonar los dias
  Rx<List<bool>> selectedDias = Rx<List<bool>>([
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ]);
  // Verificar si los datos estan guardados
  RxBool datosGuardados = false.obs;

  // init al momento de precionar crear pistas
  onCrearPistas(List<List<Tarifa>> newListTarifas) {
    listTarifas = newListTarifas;
    listActive.value =
        newListTarifas[indexDias.value].map((e) => e.disponible).toList();
    listClase =
        newListTarifas[indexDias.value].map((e) => e.clases.obs).toList();
    listLuz = newListTarifas[indexDias.value].map((e) => e.luz.obs).toList();
  }

  // Cambiar el dia
  changeDia(int index) {
    indexDias.value = index;
    listActive.value =
        listTarifas[indexDias.value].map((e) => e.disponible).toList();
    listClase = listTarifas[indexDias.value].map((e) => e.clases.obs).toList();
    listLuz = listTarifas[indexDias.value].map((e) => e.luz.obs).toList();
    changeAllActive.value = false;
  }

  // Cambiar de disponible de todo activado a desactivado
  onChangeAllActive() {
    changeAllActive.value = !changeAllActive.value;
    listActive.value =
        listActive.value.map((e) => changeAllActive.value).toList();
    if (!changeAllActive.value) {
      for (var i = 0; i < listClase.length; i++) {
        listClase[i].value = false;
      }
      for (var i = 0; i < listLuz.length; i++) {
        listLuz[i].value = false;
      }
      // Cambiar los datos y guardarlos
      for (var i = 0; i < listActive.value.length; i++) {
        listTarifas[indexDias.value][i].disponible = false;
      }
    } else {
      // Cambiar los datos y guardarlos
      for (var i = 0; i < listActive.value.length; i++) {
        listTarifas[indexDias.value][i].disponible = true;
      }
    }
  }

  // Cambiar de disponible activado a desactivado
  onChangeActive(bool activeOrDesactive, int index) {
    if (activeOrDesactive) {
      listTarifas[indexDias.value][index].clases = false;
      listTarifas[indexDias.value][index].luz = false;
      listClase[index].value = false;
      listLuz[index].value = false;
    }
    listTarifas[indexDias.value][index].disponible = !activeOrDesactive;
    listActive.value[index] = !listActive.value[index];
    listActive.refresh();
  }

  // Cambiar de clases de todo activas o desactivas
  onChangeAllClase() {
    bool isChanges = false;
    for (var i = 0; i < listActive.value.length; i++) {
      if (listActive.value[i]) {
        isChanges = true;
        listClase[i].value = changeAllClase.value;
        listTarifas[indexDias.value][i].clases = changeAllClase.value;
      }
    }
    if (isChanges) {
      changeAllClase.value = !changeAllClase.value;
    }
  }

  // Cambiar de clase activa o desactiva
  onChangeClase(bool activeOrDesactive, int index) {
    if (activeOrDesactive) {
      listClase[index].value = !listClase[index].value;
      listTarifas[indexDias.value][index].clases = listClase[index].value;
    }
  }

  // Cambiar de clases de todo activas o desactivas
  onChangeAllLuz() {
    bool isChanges = false;
    for (var i = 0; i < listActive.value.length; i++) {
      if (listActive.value[i]) {
        isChanges = true;
        listLuz[i].value = changeAllLuz.value;
        listTarifas[indexDias.value][i].luz = changeAllLuz.value;
      }
    }
    if (isChanges) {
      changeAllLuz.value = !changeAllLuz.value;
    }
  }

  // Cambiar de clase activa o desactiva
  onChangeLuz(bool activeOrDesactive, int index) {
    if (activeOrDesactive) {
      listLuz[index].value = !listLuz[index].value;
      listTarifas[indexDias.value][index].luz = listLuz[index].value;
    }
  }

  // Cambiar el precio de la tarifa socio
  onChangePrecioSocio(bool luz, int index, String precio) {
    if (luz) {
      listTarifas[indexDias.value][index].precioConLuzSocio = precio;
    } else {
      listTarifas[indexDias.value][index].precioSinLuzSocio = precio;
    }
  }

  // Cambiar el precio de la tarifa no socio
  onChangePrecioNoSocio(bool luz, int index, String precio) {
    if (luz) {
      listTarifas[indexDias.value][index].precioConLuzNoSocio = precio;
    } else {
      listTarifas[indexDias.value][index].precioSinLuzNoSocio = precio;
    }
  }

  // Cambiar los dias al clonar el dia
  onChangeClonarDia(int index) {
    selectedDias.value[index] = !selectedDias.value[index];
    selectedDias.refresh();
  }

  // Cambiar los dias al clonar el dia
  onChangeClonarBorrar() {
    selectedDias.value =
        List.generate(selectedDias.value.length, (index) => false);
  }

  // Cambiar los dias al clonar el dia
  onChangeCopiarDatos() {
    for (var i = 0; i < selectedDias.value.length; i++) {
      if (selectedDias.value[i]) {
        List<Tarifa> newListTarifas = [];
        for (Tarifa element in listTarifas[indexDias.value]) {
          if (element.disponible) {
            newListTarifas.add(Tarifa(
                disponible: true,
                clases: element.clases,
                luz: element.luz,
                horaInicio: element.horaInicio,
                precioConLuzSocio: element.precioConLuzSocio,
                precioConLuzNoSocio: element.precioConLuzNoSocio,
                precioSinLuzNoSocio: element.precioSinLuzNoSocio,
                precioSinLuzSocio: element.precioSinLuzSocio));
          } else {
            newListTarifas.add(Tarifa(
                horaInicio: element.horaInicio,
                precioConLuzSocio: element.precioConLuzSocio,
                precioConLuzNoSocio: element.precioConLuzNoSocio,
                precioSinLuzNoSocio: element.precioSinLuzNoSocio,
                precioSinLuzSocio: element.precioSinLuzSocio));
          }
        }
        listTarifas[i] = newListTarifas;
      }
    }
    Get.back();
  }

  // Guardar los datos de la tarifa
  onGuardar() {
    datosGuardados.value = true;
    Get.back();
  }
}
