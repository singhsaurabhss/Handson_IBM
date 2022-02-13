using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day1Assignments
{
    class ProductOfDigits
    {
        static void Main(string[] args)
        {
            int number, result = 0;
            number = Convert.ToInt32(Console.ReadLine());
            result = prod_of_digits(number);
            if (result == -1)
            {
                Console.WriteLine("Invalid input");
            }

            else
            {
                Console.WriteLine(result);
            }

            Console.ReadLine();


        }

        static int prod_of_digits(int num)
        {
            int rem, digit = 1;
            if (num < 0 || num > 32767)
            {
                return -1;
            }

            else
            {
                while (num != 0)
                {
                    rem = num % 10;
                    digit = digit * rem;
                    num = num / 10;
                }
            }



            return digit;
        }
    }
}
