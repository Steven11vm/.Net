import 'dart:io';

void main() {
  print("Ingrese el nombre del producto:");
  String nombre = stdin.readLineSync()!.toUpperCase();

  print("Ingrese la cantidad:");
  int stock = int.parse(stdin.readLineSync()!);
  while (stock <= 0) {
    print("La cantidad no es válida");
    print("Ingrese la cantidad:");
    stock = stock = int.parse(stdin.readLineSync()!);
  }

  print("Ingrese el precio de compra:");
  double precioCompra = double.parse(stdin.readLineSync()!);
  while (precioCompra <= 0) {
    print("El precio de compra no es válido");
    print("Ingrese el precio de compra:");
    precioCompra = precioCompra = double.parse(stdin.readLineSync()!);
  }

  print("Ingrese el precio de venta:");
  double precioVenta = double.parse(stdin.readLineSync()!);
  while (precioVenta <= 0) {
    print("El precio de venta no es válido");
    print("Ingrese el precio de venta:");
    precioVenta = precioVenta = double.parse(stdin.readLineSync()!);
  }

  Inventario compra = Inventario(
    nombre: nombre,
    stock: stock,
    preciocompra: precioCompra,
    precioventa: precioVenta,
  );
  print(compra.toString());
  while (true) {
    print("¿Qué desea hacer?");
    print("1. Comprar");
    print("2. Vender");
    print("3. Salir");
    print("---------------------");
    print("Ingrese una opción:");
    int opcion = int.parse(stdin.readLineSync()!);

    if (opcion == 1) {
      print("Ingrese la cantidad:");
      int stockcompra = int.parse(stdin.readLineSync()!);
      while (stockcompra <= 0) {
        print("La cantidad no es válida");
        print("Ingrese la cantidad:");
        stockcompra = stockcompra = int.parse(stdin.readLineSync()!);
      }
      compra.registro_compra(stockcompra);
      print(compra);
    } else if (opcion == 2) {
      print("Ingrese la cantidad:");
      int stockcompra = int.parse(stdin.readLineSync()!);

      while (stockcompra <= 0) {
        print("La cantidad no es válida");
        print("Ingrese la cantidad:");
        stockcompra = stockcompra = int.parse(stdin.readLineSync()!);
      }
      compra.venta(stock, stockcompra);
      print(compra);
    } else if (opcion == 3) {
      print("adios");
      break;
    }
  }
}

class Inventario {
  String? nombre;
  int stock;
  double? preciocompra;
  double? precioventa;

  Inventario({
    required String this.nombre,
    required int this.stock,
    required double this.preciocompra,
    required double this.precioventa,
  });

  void registro_compra(int stock) {
    this.stock += stock;
  }

  void venta(int stock, int cantidad) {
    if (cantidad <= 5) {
      print("no se puede dejar el stock por menos de 5 ");
    } else if (cantidad > this.stock) {
      print("el valor no debe superar al stock");
    } else if (cantidad <= 0) {
      print("la cantidad no es valida");
    } else {
      this.stock -= cantidad;
    }
  }

//metodo comprar para validar el stock
//vender validar que el stock sea superior al actual,menor
  @override
  String toString() {
    return "Producto: $nombre - Stock: $stock - Precio de compra: $preciocompra - Precio de venta: $precioventa";
  }
}
