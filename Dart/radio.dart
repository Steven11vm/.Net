import 'dart:io';
import 'dart:math';

class Circulo {
  double radio;

  Circulo(this.radio);

  double calcularArea() {
    if (radio < 0) {
      throw ArgumentError('El radio no puede ser negativo');
    }
    return pi * radio * radio;
  }

  double calcularPerimetro() {
    if (radio < 0) {
      throw ArgumentError('El radio no puede ser negativo');
    }
    return 2 * pi * radio;
  }
}

void main() {
  try {
    print('Ingrese el valor del radio del círculo:');
    double radio = double.parse(stdin.readLineSync()!);

    Circulo miCirculo = Circulo(radio);

    print('Área del círculo: ${miCirculo.calcularArea()}');
    print('Perímetro del círculo: ${miCirculo.calcularPerimetro()}');
  } catch (e) {
    print('Error: $e');
  }
}
