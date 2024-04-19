using System;

class Program
{
    static void Main(string[] args)
    {
        int numero;
        int numeroEspecifico;
        int mayor = int.MinValue;
        int menor = int.MaxValue;
        int positivos = 0;
        int negativos = 0;

        Console.WriteLine("Introduce números. Cuando quieras detener la entrada, escribe el número específico:");
        numeroEspecifico = int.Parse(Console.ReadLine());

        Console.WriteLine("Introduce un número:");
        numero = int.Parse(Console.ReadLine());

        while (numero != numeroEspecifico)
        {
            // Verifica si es mayor o menor
            if (numero > mayor)
            {
                mayor = numero;
            }
            if (numero < menor)
            {
                menor = numero;
            }

            // Verifica si es positivo o negativo
            if (numero < 0)
            {
                negativos++;
            }
            else if (numero > 0)
            {
                positivos++;
            }

            Console.WriteLine("Introduce otro número:");
            numero = int.Parse(Console.ReadLine());
        }

        Console.WriteLine($"El número mayor es: {mayor}");
        Console.WriteLine($"El número menor es: {menor}");
        Console.WriteLine($"Cantidad de números positivos: {positivos}");
        Console.WriteLine($"Cantidad de números negativos: {negativos}");
    }
}
