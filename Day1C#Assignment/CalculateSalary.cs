using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day1Assignments
{
    class Temp
    {
        public int calculateSal(int salary, int shifts)
        {
            int saving = 0;
            saving = (int)((salary * 0.5) + (salary * 0.02 * shifts));
            return saving;
        }
    }

    class CalculateSalary
    {
        static void Main(String[] args)
        {
            int salary, shifts;
            salary = Convert.ToInt32(Console.ReadLine());
            shifts = Convert.ToInt32(Console.ReadLine());
            if (salary > 8000)
            {
                Console.WriteLine("Salary too large");
                Console.ReadLine();
            }
            else if (shifts < 0)
            {
                Console.WriteLine("Shifts too small");
                Console.ReadLine();
            }

            else if (salary < 0)
            {
                Console.WriteLine("Salary too small");
                Console.ReadLine();
            }

            else
            {
                Temp t = new Temp();
                int savings = t.calculateSal(salary, shifts);
                Console.WriteLine(savings);
                Console.ReadLine();
            }
        }
    }
}
