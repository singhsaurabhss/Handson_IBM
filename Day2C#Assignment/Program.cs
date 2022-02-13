using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOPsDemoClass
{
    class Program
    {
        static void Main(string[] args)
        {
            //Student student = new Student();

            Student[] student = new Student[2];
            for(int i = 0; i < 2; i++)
            {
                student[i] = new Student();
                student[i].getStudentDetail();
            }
            Console.WriteLine("Roll no  Name \t Mark1 \t Mark2 \t Mark3 \t Mark4 \t Mark5 \t Total \t Grade \n");
            for (int i = 0; i < 2; i++)
            {
                student[i].printStudentDetail();
            }



            Console.ReadKey();
        }
    }
}
