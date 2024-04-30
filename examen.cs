using System;

Credito credito = new Credito();

bool salir = false;

while (!salir)
{
    Console.WriteLine("Bienvenido");
    Console.WriteLine("1. Registrar el valor total de compras");
    Console.WriteLine("2. Realizar un abono");
    Console.WriteLine("3. Pagar credito");
    Console.WriteLine("4. Consultar Cupo Crédito y saldo");
    Console.WriteLine("5. Consultar total de puntos");
    Console.WriteLine("6. Salir");

    Console.Write("Seleccione una de las opciones: ");
    int opcion = int.Parse(Console.ReadLine());

    switch (opcion)
    {
        case 1:
            Console.Write("Ingrese el valor total de la compra: ");
            double valorCompra = double.Parse(Console.ReadLine());
            credito.RegistrarCompra(valorCompra);
            break;
        case 2:
            Console.Write("Ingrese el valor del avance: ");
            double valorAvance = double.Parse(Console.ReadLine());
            credito.RealizarAvance(valorAvance);
            break;
        case 3:
            Console.Write("Ingrese el valor a abonar: ");
            double valorAbono = double.Parse(Console.ReadLine());
            credito.PagarCredito(valorAbono);
            break;
        case 4:
            Console.WriteLine("Cupo de credito: " + credito.CupoCredito);
            Console.WriteLine("Saldo por pagar: " + credito.SaldoPorPagar);
            break;
        case 5:
            Console.WriteLine("Total de puntos: " + credito.CalcularTotalPuntos());
            break;
        case 6:
            salir = true;
            break;
        default:
            Console.WriteLine("Opcion invalida. Por favor seleccione una opción válida entre el 1 y el 6    .");
            break;
    }
}

class Credito
{
    private const double CupoCredito = 1000000;
    private double _saldoPorPagar = 0;
    private int _totalPuntos = 0;

    public double SaldoPorPagar { get { return _saldoPorPagar; } }

    public void RegistrarCompra(double valorCompra)
    {
        if (valorCompra <= 0)
        {
            Console.WriteLine("El valor de la compra debe ser mayor a cero .");
            return;
        }

        if (_saldoPorPagar == CupoCredito)
        {
            Console.WriteLine("No se pueden realizar compras si el cupo del crédito es igual al saldo por pagar.");
            return;
        }

        if (valorCompra > (CupoCredito - _saldoPorPagar))
        {
            Console.WriteLine("El valor de la compra excede el cupo de crédito disponible.");
            return;
        }

        _saldoPorPagar += valorCompra;
        if (valorCompra >= 100000)
        {
            _totalPuntos += (int)(valorCompra * 0.01);
        }
    }

    public void RealizarAvance(double valorAvance)
    {
        if (valorAvance <= 0)
        {
            Console.WriteLine("El valor del avance debe ser mayor que cero.");
            return;
        }

        if (_saldoPorPagar == CupoCredito)
        {
            Console.WriteLine("No se pueden realizar avances si el cupo del crédito es igual al saldo por pagar.");
            return;
        }

        if (valorAvance > (CupoCredito - _saldoPorPagar))
        {
            Console.WriteLine("El valor del avance excede el cupo de crédito disponible.");
            return;
        }

        _saldoPorPagar += valorAvance;
    }

    public void PagarCredito(double valorAbono)
    {
        if (valorAbono <= 0)
        {
            Console.WriteLine("El valor del abono debe ser mayor que cero.");
            return;
        }

        if (valorAbono > _saldoPorPagar)
        {
            Console.WriteLine("El valor del abono excede el saldo por pagar.");
            return;
        }

        _saldoPorPagar -= valorAbono;
    }

    public int CalcularTotalPuntos()
    {
        return _totalPuntos;
    }
}

