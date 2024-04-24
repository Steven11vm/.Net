import 'dart:io';

class Producto {
  String nombre;
  double precio;
  int cantidad;

  Producto(this.nombre, this.precio, this.cantidad);
}

List<Producto> listaProductos = [];

void main() {
  bool salir = false;

  while (!salir) {
    print("\n=== Gestión de Productos ===");
    print("1. Insertar Producto");
    print("2. Modificar Producto");
    print("3. Eliminar Producto");
    print("4. Consultar Productos");
    print("5. Salir");

    stdout.write("Seleccione una opción: ");
    String opcion = stdin.readLineSync() ?? '';
    switch (opcion) {
      case '1':
        insertarProducto();
        break;
      case '2':
        modificarProducto();
        break;
      case '3':
        eliminarProducto();
        break;
      case '4':
        consultarProductos();
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

void insertarProducto() {
  stdout.write("Ingrese el nombre del producto: ");
  String nombre = stdin.readLineSync() ?? '';

  stdout.write("Ingrese el precio del producto: ");
  double precio = double.parse(stdin.readLineSync() ?? '0');

  stdout.write("Ingrese la cantidad disponible del producto: ");
  int cantidad = int.parse(stdin.readLineSync() ?? '0');

  listaProductos.add(Producto(nombre, precio, cantidad));
  print("Producto insertado exitosamente.");
}

void modificarProducto() {
  stdout.write("Ingrese el nombre del producto a modificar: ");
  String nombre = stdin.readLineSync() ?? '';

  Producto productoEncontrado = listaProductos.firstWhere(
      (producto) => producto.nombre.toLowerCase() == nombre.toLowerCase(),
      orElse: () => null);

  if (productoEncontrado != null) {
    stdout.write("Ingrese el nuevo precio del producto: ");
    double nuevoPrecio = double.parse(stdin.readLineSync() ?? '0');

    stdout.write("Ingrese la nueva cantidad disponible del producto: ");
    int nuevaCantidad = int.parse(stdin.readLineSync() ?? '0');

    productoEncontrado.precio = nuevoPrecio;
    productoEncontrado.cantidad = nuevaCantidad;

    print("Producto modificado exitosamente.");
  } else {
    print("Producto no encontrado.");
  }
}

void eliminarProducto() {
  stdout.write("Ingrese el nombre del producto a eliminar: ");
  String nombre = stdin.readLineSync() ?? '';

  listaProductos.removeWhere(
      (producto) => producto.nombre.toLowerCase() == nombre.toLowerCase());
  print("Producto eliminado exitosamente.");
}

void consultarProductos() {
  print("\n=== Productos en la Barbería ===");
  if (listaProductos.isEmpty) {
    print("No hay productos en la lista.");
  } else {
    for (var producto in listaProductos) {
      print(
          "Nombre: ${producto.nombre}, Precio: \$${producto.precio}, Cantidad: ${producto.cantidad}");
    }
  }
}
