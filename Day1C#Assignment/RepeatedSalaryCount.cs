using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day1Assignments
{
    class RepeatedSalaryCount
    {
        static void Main(string[] args)
        {
            int size, flag = 0, no_of_elements = 0;
            size = int.Parse(Console.ReadLine());
            if (size < 0)
            {
                Console.WriteLine("Invalid input");
            }

            int[] arr = new int[size];

            for (int i = 0; i < arr.Length; i++)
            {
                arr[i] = int.Parse(Console.ReadLine());
                if (arr[i] < 0)
                {
                    flag = 1;
                    break;
                }
            }

            if (flag == 1)
            {
                Console.WriteLine("Invalid input");
                Console.ReadLine();
                Environment.Exit(0);
            }

            no_of_elements = repeatCount(arr, size);
            Console.WriteLine(no_of_elements);
            Console.ReadLine();
        }

        static int repeatCount(int[] arr, int size)
        {
            int counter = 1;
            for (int i = 0; i < size; i++)
            {
                for (int j = i + 1; j < size; j++)
                {
                    if (arr[i] == arr[j])
                    {
                        counter++;
                        break;
                    }
                }
            }

            return counter;
        }
    }
}
