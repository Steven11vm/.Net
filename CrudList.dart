import 'dart:io';

void main() {
  List<String> productos = [];

  while (true) {
    print("dijite la opcion que desea hacer en la lista");
    print("1.agregar un elemento");
    print("2.eliminar un elemento");
    print("3.buscar un elemento");
    print("4.editar un elemento ");
    print("5.ver la lista ");
    print("6.salir");
    print("que operacion quiere hacer?: ");
    int opcion = int.parse(stdin.readLineSync()!);

    if (opcion == 1) {
      print("dijite el producto que desea agregar");
      String producto = stdin.readLineSync()!.toUpperCase();
      if (productos.contains(producto)) {
        print("el producto ya fue registrado\n");
      } else {
        productos.add(producto);
        print(productos);
      }
    } else if (opcion == 2) {
      print(productos);
      print("dijite el producto que desea eliminar");
      String producto = stdin.readLineSync()!.toUpperCase();
      if (productos.contains(producto)) {
        productos.remove(producto);
        print("el producto se borro exitosamente\n");
        print(productos);
      } else {
        print("el producto no se encuentra en la lista\n");
      }
    } else if (opcion == 3) {
      print("dijite el producto que desea buscar");
      String producto = stdin.readLineSync()!.toUpperCase();
      if (productos.contains(producto)) {
        print("el producto esta en la lista");
      } else {
        print("el producto no se encuentra en la lista");
      }
    } else if (opcion == 4) {
      print(productos);
      print("dijite el producto que desea editar");
      String producto = stdin.readLineSync()!.toUpperCase();
      print("dijite el nuevo producto");
      String productoedit = stdin.readLineSync()!.toUpperCase();
      if (productos.contains(productoedit)) {
        print("el producto ya esta en la lista");
      } else {
        if (productos.contains(producto)) {
          productos[productos.indexOf(producto)] = productoedit;
          print("se edito correctamente el producto");
          print(productos);
        } else {
          print("el elemento buscado no se encuentra en la lista");
        }
      }
    } else if (opcion == 5) {
      if (productos.length == 0) {
        print("la lista esta vacia");
      } else {
        for (var i = 0; i < productos.length; i++) {
          print(productos[i]);
        }
      }
    } else if (opcion == 6) {
      print("Chauuuuuuuuuu");
      break;
    }
  }
}
