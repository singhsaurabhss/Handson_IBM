using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessSpecifierDemo
{
    public class RBI
    {
        public float rate_rbi = 6.5f;
        public float calculateBalRBI(int amount, int years)
        {
            return amount + ((amount * rate_rbi * years) / 100);
        }
    }
    public class SBI : RBI
    {
        public float rate_sbi = 7f;
        public float calculateBalSBI(int amount, int years)
        {
            return amount + ((amount * rate_sbi * years) / 100);
        }
    }
    public class Canera : SBI
    {
        public float rate_canera = 7.5f;
        public float calculateBalCanera(int amount, int years)
        {
            return amount + ((amount * rate_canera * years) / 100);
        }
    }
    public class MultilevelInheritance
    {
        public static void Main(string[] args)
        {
            Canera c = new Canera();
            Console.WriteLine("Enter the amount you want to invest : ");
            int amount = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("How many time you want to invest (in years) : ");
            int years = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Canera Bank policy amount after " + years + " years will be " + c.calculateBalCanera(amount, years));
            Console.WriteLine("State Bank of India policy amount after " + years + " years will be " + c.calculateBalSBI(amount, years));
            Console.WriteLine("Reserve Bakk of India policy amount after " + years + " years will be " + c.calculateBalRBI(amount, years));
            Console.ReadLine();
        }
    }
}
