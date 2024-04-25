import 'dart:io';

void main() {
  bool salir = false;

  while (!salir) {
    print("\n=== Calculadora ===");
    print("1. Suma");
    print("2. Resta");
    print("3. Multiplicación");
    print("4. División");
    print("5. Salir");

    stdout.write("Seleccione una opción: ");
    String opcion = stdin.readLineSync() ?? '';
    switch (opcion) {
      case '1':
        realizarOperacion('+');
        break;
      case '2':
        realizarOperacion('-');
        break;
      case '3':
        realizarOperacion('*');
        break;
      case '4':
        realizarOperacion('/');
        break;
      case '5':
        salir = true;
        print("¡Adiós!");
        break;
      default:
        print("Opción no válida. Por favor, seleccione una opción válida.");
    }
  }
}

void realizarOperacion(String operador) {
  stdout.write("Ingrese el primer número: ");
  double num1 = double.parse(stdin.readLineSync() ?? '0');

  stdout.write("Ingrese el segundo número: ");
  double num2 = double.parse(stdin.readLineSync() ?? '0');

  double resultado = 0;

  switch (operador) {
    case '+':
      resultado = num1 + num2;
      break;
    case '-':
      resultado = num1 - num2;
      break;
    case '*':
      resultado = num1 * num2;
      break;
    case '/':
      if (num2 != 0) {
        resultado = num1 / num2;
      } else {
        print("Error: No se puede dividir por cero.");
        return;
      }
      break;
    default:
      print("Operador no válido.");
      return;
  }

  print("El resultado de la operación es: $resultado");
}
