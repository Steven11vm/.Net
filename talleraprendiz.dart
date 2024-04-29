import 'dart:math';
import 'dart:io';

void main() {
  List<String> documentos = List.filled(100, '');
  List<String> nombres = List.filled(100, '');
  List<int> inasistencias = List.filled(100, 0);

  int opcion;

  do {
    print("Menu:");
    print("1. Registrar inasistencias");
    print("2. Listar Todas Inasistencias");
    print("3. Listar los aprendices con inasistencias superiores a 3");
    print("4. Consultar el total de inasistencias por aprendiz");
    print("5. Valor a Pagar");
    print("6. Número de suerte");
    print("7. Salir");
    stdout.write("Ingrese su opción: ");

    opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        registrarInasistencias(documentos, nombres, inasistencias);
        break;
      case 2:
        listarTodasInasistencias(documentos, nombres, inasistencias);
        break;
      case 3:
        listarInasistenciasSuperioresATres(documentos, nombres, inasistencias);
        break;
      case 4:
        consultarTotalInasistenciasPorAprendiz(
            documentos, nombres, inasistencias);
        break;
      case 5:
        calcularValorAPagar();
        break;
      case 6:
        generarNumeroDeSuerte();
        break;
    }
  } while (opcion != 7);
}

void registrarInasistencias(
    List<String> documentos, List<String> nombres, List<int> inasistencias) {
  stdout.write("Ingrese documento del aprendiz: ");
  String documento = stdin.readLineSync()!;

  int index = documentos.indexOf(documento);
  if (index != -1) {
    stdout.write("Aprendiz encontrado. Ingrese cantidad de inasistencias: ");
    int cantidad = int.parse(stdin.readLineSync()!);
    while (cantidad < 1 || cantidad > 100) {
      print("Cantidad no válida.");
      stdout.write("Ingrese cantidad de inasistencias: ");
      cantidad = int.parse(stdin.readLineSync()!);
    }
    inasistencias[index] += cantidad;
    print("Inasistencias actualizadas.");
  } else {
    stdout.write("Ingrese nombre del aprendiz: ");
    String nombre = stdin.readLineSync()!;
    int i = documentos.indexOf('');
    if (i != -1) {
      documentos[i] = documento;
      nombres[i] = nombre;
      print("Aprendiz registrado correctamente.");
    } else {
      print("No hay espacio para más aprendices.");
    }
  }
}

void listarTodasInasistencias(
    List<String> documentos, List<String> nombres, List<int> inasistencias) {
  print("Inasistencias de todos los aprendices:");
  for (int i = 0; i < documentos.length; i++) {
    if (documentos[i] != '') {
      print(
          "Documento: ${documentos[i]}, Nombre: ${nombres[i]}, Inasistencias: ${inasistencias[i]}");
    }
  }
}

void listarInasistenciasSuperioresATres(
    List<String> documentos, List<String> nombres, List<int> inasistencias) {
  print("Aprendices con inasistencias superiores a 3:");
  for (int i = 0; i < documentos.length; i++) {
    if (documentos[i] != '' && inasistencias[i] > 3) {
      print(
          "Documento: ${documentos[i]}, Nombre: ${nombres[i]}, Inasistencias: ${inasistencias[i]}");
    }
  }
}

void consultarTotalInasistenciasPorAprendiz(
    List<String> documentos, List<String> nombres, List<int> inasistencias) {
  stdout.write("Ingrese documento del aprendiz: ");
  String documento = stdin.readLineSync()!;

  int index = documentos.indexOf(documento);
  if (index != -1) {
    print(
        "Total de inasistencias para el aprendiz ${nombres[index]}: ${inasistencias[index]}");
  } else {
    print("Aprendiz no encontrado.");
  }
}

void calcularValorAPagar() {
  print("Ingrese el código del producto:");
  String codigo = stdin.readLineSync()!;

  print("Ingrese el nombre del producto:");
  String nombre = stdin.readLineSync()!;

  print("Ingrese el precio del producto:");
  double precio = double.parse(stdin.readLineSync()!);
  while (precio <= 0) {
    print("Precio inválido. Intente de nuevo.");
    print("Ingrese el precio del producto:");
    precio = double.parse(stdin.readLineSync()!);
  }

  print("Ingrese la cantidad del producto:");
  int cantidad = int.parse(stdin.readLineSync()!);
  while (cantidad <= 0) {
    print("Cantidad inválida. Intente de nuevo.");
    print("Ingrese la cantidad del producto:");
    cantidad = int.parse(stdin.readLineSync()!);
  }

  double valorBruto = precio * cantidad;
  double descuento = cantidad > 10 ? valorBruto * 0.1 : 0;
  double iva = valorBruto * 0.19;
  double valorAPagar = valorBruto + iva - descuento;

  print("Valor a pagar: $valorAPagar");
}

void generarNumeroDeSuerte() {
  Random rnd = Random();
  int numeroSuerte = rnd.nextInt(1000);
  print("Número de suerte: ${numeroSuerte.toString().padLeft(3, '0')}");
}
