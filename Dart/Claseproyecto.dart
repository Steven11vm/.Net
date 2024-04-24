class Proveedor {
  String nombre;
  String direccion;

  Proveedor(this.nombre, this.direccion);

  void registrarDatos() {
    print('Registrando datos del proveedor:');
    print('Nombre: $nombre');
    print('Dirección: $direccion');
    print('Datos registrados exitosamente.');
  }
}

void main() {
  Proveedor miProveedor = Proveedor('Proveedor A', 'Calle Principal 123');
  miProveedor.registrarDatos();
}
