import 'dart:io';

class Cuenta {
  String numeroCuenta;
  double saldo;

  Cuenta(this.numeroCuenta, this.saldo);
}

void main() {
  List<Cuenta> cuentas = [];

  while (true) {
    print('MENU:');
    print('1. Registrar cuenta.');
    print('2. Consignar dinero .');
    print('3. Transferir dinero.');
    print('4. Retirar dinero');
    print('5. Salir');

    var opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        registrarCuenta(cuentas);
        break;
      case 2:
        consignarDinero(cuentas);
        break;
      case 3:
        transferirDinero(cuentas);
        break;
      case 4:
        retirarDinero(cuentas);
        break;
      case 5:
        exit(0);
      default:
        print('Opción no valida. Por favor, seleccione una opcion correcta.');
    }
  }
}

void registrarCuenta(List<Cuenta> cuentas) {
  print('Ingrese el numero de cuenta: ');
  var numeroCuenta = stdin.readLineSync()!;

  if (cuentas.any((cuenta) => cuenta.numeroCuenta == numeroCuenta)) {
    print('Esta cuenta ya esta registrada');
    return;
  }

  cuentas.add(Cuenta(numeroCuenta, 0));
  print('Cuenta registrada exitosamente.');
}

void consignarDinero(List<Cuenta> cuentas) {
  print('Ingrese el número de cuenta:');
  var numeroCuenta = stdin.readLineSync()!;
  var cuenta = cuentas.firstWhere(
      (cuenta) => cuenta.numeroCuenta == numeroCuenta,
      orElse: () => Cuenta("", 0));

  if (cuenta.numeroCuenta.isEmpty) {
    print('La cuenta no existe.');
    return;
  }

  print('Ingrese el monto a consignar:');
  var monto = double.parse(stdin.readLineSync()!);

  cuenta.saldo += monto;
  print('Consignacion exitosa. Nuevo saldo: ${cuenta.saldo}');
}

void transferirDinero(List<Cuenta> cuentas) {
  print('Ingrese el número de cuenta de origen:');
  var origen = stdin.readLineSync()!;
  var cuentaOrigen = cuentas.firstWhere(
      (cuenta) => cuenta.numeroCuenta == origen,
      orElse: () => Cuenta("", 0));

  if (cuentaOrigen.numeroCuenta.isEmpty) {
    print('La cuenta de oriegen no existe .');
    return;
  }

  print('Ingrese el número de cuenta al que se va a enviar el dinero: ');
  var destino = stdin.readLineSync()!;
  var cuentaDestino = cuentas.firstWhere(
      (cuenta) => cuenta.numeroCuenta == destino,
      orElse: () => Cuenta("", 0));

  if (cuentaDestino.numeroCuenta.isEmpty) {
    print('La cuenta de destino no existe.');
    return;
  }

  print('Ingrese el monto a transferir:');
  var monto = double.parse(stdin.readLineSync()!);

  if (monto <= 0 || monto > cuentaOrigen.saldo) {
    print('Monto inválido para transferir.');
    return;
  }

  cuentaOrigen.saldo -= monto;
  cuentaDestino.saldo += monto;
  print('Transferencia exitosa.');
}

void retirarDinero(List<Cuenta> cuentas) {
  print('Ingrese el número de cuenta:');
  var numeroCuenta = stdin.readLineSync()!;
  var cuenta = cuentas.firstWhere(
      (cuenta) => cuenta.numeroCuenta == numeroCuenta,
      orElse: () => Cuenta("", 0));

  if (cuenta.numeroCuenta.isEmpty) {
    print('La cuenta no existe.');
    return;
  }

  print('Ingrese el monto a retirar:');
  var monto = double.parse(stdin.readLineSync()!);

  if (monto <= 0 || monto > cuenta.saldo) {
    print('No hay suficiente.monto invalido.');
    return;
  }

  cuenta.saldo -= monto;
  print('Retiro exitoso. Nuevo saldo: ${cuenta.saldo}');
}
