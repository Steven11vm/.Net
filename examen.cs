using System;
using System.Collections.Generic;

class Cuenta 
{  
    public string NumeroCuenta { get; set; }  
    public double Saldo { get; set; }

    public Cuenta(string numeroCuenta, double saldo)
    {
        NumeroCuenta = numeroCuenta;
        Saldo = saldo;
    }
}

class Program
{
    static List<Cuenta> cuentas = new List<Cuenta>();

    static void Main(string[] args)
    {
        while (true)
        {
            MostrarMenu();
            int opcion = LeerOpcion();

            switch (opcion)
            {
                case 1:
                    RegistrarCuenta();
                    break;
                case 2:
                    ConsignarDinero();
                    break;
                case 3:
                    TransferirDinero();
                    break;
                case 4:
                    RetirarDinero();
                    break;
                case 5:
                    Environment.Exit(0);
                    break;
                default:
                    Console.WriteLine("Opción no válida. Por favor, seleccione una opción correcta.");
                    break;
            }
        }
    }

    static void MostrarMenu()
    {
        Console.WriteLine("MENU:");
        Console.WriteLine("1. Registrar cuenta.");
        Console.WriteLine("2. Consignar dinero.");
        Console.WriteLine("3. Transferir dinero.");
        Console.WriteLine("4. Retirar dinero.");
        Console.WriteLine("5. Salir");
        Console.Write("Seleccione una opción: ");
    }

    static int LeerOpcion()
    {
        int opcion;
        while (!int.TryParse(Console.ReadLine(), out opcion))
        {
            Console.WriteLine("Opción inválida. Por favor, seleccione una opción numérica.");
            Console.Write("Seleccione una opción: ");
        }
        return opcion;
    }

    static void RegistrarCuenta()
    {
        Console.Write("Ingrese el número de cuenta: ");
        string numeroCuenta = Console.ReadLine();

        if (cuentas.Exists(cuenta => cuenta.NumeroCuenta == numeroCuenta))
        {
            Console.WriteLine("Esta cuenta ya está registrada.");
            return;
        }

        cuentas.Add(new Cuenta(numeroCuenta, 0));
        Console.WriteLine("Cuenta registrada exitosamente.");
    }

    static void ConsignarDinero()
    {
        Console.Write("Ingrese el número de cuenta: ");
        string numeroCuenta = Console.ReadLine();

        Cuenta cuenta = cuentas.Find(cuenta => cuenta.NumeroCuenta == numeroCuenta);

        if (cuenta == null)
        {
            Console.WriteLine("La cuenta no existe.");
            return;
        }

        Console.Write("Ingrese el monto a consignar: ");
        double monto = double.Parse(Console.ReadLine());

        cuenta.Saldo += monto;
        Console.WriteLine($"Consignación exitosa. Nuevo saldo: {cuenta.Saldo}");
    }

    static void TransferirDinero()
    {
        Console.Write("Ingrese el número de cuenta de origen: ");
        string origen = Console.ReadLine();
        Cuenta cuentaOrigen = cuentas.Find(cuenta => cuenta.NumeroCuenta == origen);

        if (cuentaOrigen == null)
        {
            Console.WriteLine("La cuenta de origen no existe.");
            return;
        }

        Console.Write("Ingrese el número de cuenta de destino: ");
        string destino = Console.ReadLine();
        Cuenta cuentaDestino = cuentas.Find(cuenta => cuenta.NumeroCuenta == destino);

        if (cuentaDestino == null)
        {
            Console.WriteLine("La cuenta de destino no existe.");
            return;
        }

        Console.Write("Ingrese el monto a transferir: ");
        double monto = double.Parse(Console.ReadLine());

        if (monto <= 0 || monto > cuentaOrigen.Saldo)
        {
            Console.WriteLine("Monto inválido para transferir.");
            return;
        }

        cuentaOrigen.Saldo -= monto;
        cuentaDestino.Saldo += monto;
        Console.WriteLine("Transferencia exitosa.");
    }

    static void RetirarDinero()
    {
        Console.Write("Ingrese el número de cuenta: ");
        string numeroCuenta = Console.ReadLine();
        Cuenta cuenta = cuentas.Find(cuenta => cuenta.NumeroCuenta == numeroCuenta);

        if (cuenta == null)
        {
            Console.WriteLine("La cuenta no existe.");
            return;
        }

        Console.Write("Ingrese el monto a retirar: ");
        double monto = double.Parse(Console.ReadLine());

        if (monto <= 0 || monto > cuenta.Saldo)
        {
            Console.WriteLine("Monto inválido para retirar.");
            return;
        }

        cuenta.Saldo -= monto;
        Console.WriteLine($"Retiro exitoso. Nuevo saldo: {cuenta.Saldo}");
    }
}
