using System;

class Program
{
    static void Main(string[] args)
    {
        string[] documentos = new string[100];
        string[] nombres = new string[100];
        int[] inasistencias = new int[100];

        int opcion;

        do
        {
            Console.WriteLine("Menu:");
            Console.WriteLine("1. Registrar inasistencias");
            Console.WriteLine("2. Listar Todas Inasistencias");
            Console.WriteLine("3. Listar los aprendices con inasistencias superiores a 3");
            Console.WriteLine("4. Consultar el total de inasistencias por aprendiz");
            Console.WriteLine("5. Valor a Pagar");
            Console.WriteLine("6. Número de suerte");
            Console.WriteLine("7. Salir");
            Console.Write("Ingrese su opción: ");

            while (!int.TryParse(Console.ReadLine(), out opcion) || opcion < 1 || opcion > 7)
            {
                Console.WriteLine("Opción inválida. Intente de nuevo.");
                Console.Write("Ingrese su opción: ");
            }

            switch (opcion)
            {
                case 1:
                    RegistrarInasistencias(documentos, nombres, inasistencias);
                    break;
                case 2:
                    ListarTodasInasistencias(documentos, nombres, inasistencias);
                    break;
                case 3:
                    ListarInasistenciasSuperioresATres(documentos, nombres, inasistencias);
                    break;
                case 4:
                    ConsultarTotalInasistenciasPorAprendiz(documentos, nombres, inasistencias);
                    break;
                case 5:
                    CalcularValorAPagar();
                    break;
                case 6:
                    GenerarNumeroDeSuerte();
                    break;
            }
        } while (opcion != 7);
    }

    static void RegistrarInasistencias(string[] documentos, string[] nombres, int[] inasistencias)
    {
        Console.Write("Ingrese documento del aprendiz: ");
        string documento = Console.ReadLine();

        int index = Array.IndexOf(documentos, documento);
        if (index != -1)
        {
            Console.Write("Aprendiz encontrado. Ingrese cantidad de inasistencias: ");
            int cantidad;
            while (!int.TryParse(Console.ReadLine(), out cantidad) || cantidad < 1 || cantidad > 100)
            {
                Console.WriteLine("Cantidad no validad.");
                Console.Write("Ingrese cantidad de inasistencias: ");
            }
            inasistencias[index] += cantidad;
            Console.WriteLine("Inasistencias actualizadas .");
        }
        else
        {
            Console.Write("Ingrese nombre del aprendiz: ");
            string nombre = Console.ReadLine();

            int i = Array.IndexOf(documentos, null);
            if (i != -1)
            {
                documentos[i] = documento;
                nombres[i] = nombre;
                Console.WriteLine("Aprendiz registrado correctamente.");
            }
            else
            {
                Console.WriteLine("No hay espacio para más aprendices.");
            }
        }
    }

    static void ListarTodasInasistencias(string[] documentos, string[] nombres, int[] inasistencias)
    {
        Console.WriteLine("Inasistencias de todos los aprendices:");
        for (int i = 0; i < documentos.Length; i++)
        {
            if (documentos[i] != null)
            {
                Console.WriteLine($"Documento: {documentos[i]}, Nombre: {nombres[i]}, Inasistencias: {inasistencias[i]}");
            }
        }
    }

    static void ListarInasistenciasSuperioresATres(string[] documentos, string[] nombres, int[] inasistencias)
    {
        Console.WriteLine("Aprendices con inasistencias superiores a 3:");
        for (int i = 0; i < documentos.Length; i++)
        {
            if (documentos[i] != null && inasistencias[i] > 3)
            {
                Console.WriteLine($"Documento: {documentos[i]}, Nombre: {nombres[i]}, Inasistencias: {inasistencias[i]}");
            }
        }
    }

    static void ConsultarTotalInasistenciasPorAprendiz(string[] documentos, string[] nombres, int[] inasistencias)
    {
        Console.Write("Ingrese documento del aprendiz: ");
        string documento = Console.ReadLine();

        int index = Array.IndexOf(documentos, documento);
        if (index != -1)
        {
            Console.WriteLine($"Total de inasistencias para el aprendiz {nombres[index]}: {inasistencias[index]}");
        }
        else
        {
            Console.WriteLine("Aprendiz no encontrado.");
        }
    }

    static void CalcularValorAPagar()
    {
        Console.WriteLine("Ingrese el código del producto:");
        string codigo = Console.ReadLine();

        Console.WriteLine("Ingrese el nombre del producto:");
        string nombre = Console.ReadLine();

        Console.WriteLine("Ingrese el precio del producto:");
        decimal precio;
        while (!decimal.TryParse(Console.ReadLine(), out precio) || precio <= 0)
        {
            Console.WriteLine("Precio inválido. Intente de nuevo.");
            Console.WriteLine("Ingrese el precio del producto:");
        }

        Console.WriteLine("Ingrese la cantidad del producto:");
        int cantidad;
        while (!int.TryParse(Console.ReadLine(), out cantidad) || cantidad <= 0)
        {
            Console.WriteLine("Cantidad inválida. Intente de nuevo.");
            Console.WriteLine("Ingrese la cantidad del producto:");
        }

        decimal valorBruto = precio * cantidad;
        decimal descuento = cantidad > 10 ? valorBruto * 0.1m : 0;
        decimal iva = valorBruto * 0.19m;
        decimal valorAPagar = valorBruto + iva - descuento;

        Console.WriteLine($"Valor a pagar: {valorAPagar}");
    }

    static void GenerarNumeroDeSuerte()
    {
        Random rnd = new Random();
        int numeroSuerte = rnd.Next(0, 1000);
        string numeroSuerteStr = numeroSuerte.ToString("D3");
        Console.WriteLine($"Número de suerte: {numeroSuerteStr}");
    }

}
