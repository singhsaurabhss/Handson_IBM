using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOPsDemoClass
{
    class Student
    {
        int sid, mark1, mark2, mark3, mark4, mark5, total;
        double percentage;
        string name, grade;
        public void getStudentDetail()
        {
            Console.WriteLine("Enter the student id,Name, Mark1, Mark2, Mark3, Mark4, Mark5 : ");
            sid = Convert.ToInt32(Console.ReadLine());
            name = Console.ReadLine();
            mark1 = Convert.ToInt32(Console.ReadLine());
            mark2 = Convert.ToInt32(Console.ReadLine());
            mark3 = Convert.ToInt32(Console.ReadLine());
            mark4 = Convert.ToInt32(Console.ReadLine());
            mark5 = Convert.ToInt32(Console.ReadLine());
            
        }
        public void printStudentDetail()
        {
            total = mark1 + mark2 + mark3 + mark4 + mark5;
            /*Console.WriteLine("Student Id " + sid);
            Console.WriteLine("Student Name " + name);
            Console.WriteLine("Mark 1 " + mark1);
            Console.WriteLine("Mark 2 : " + mark2);
            Console.WriteLine("Mark 3 " + mark3);
            Console.WriteLine("Mark 4 " + mark4);
            Console.WriteLine("Mark 5 : " + mark5);
            Console.WriteLine("Total = " + total);*/

            percentage = total / 5;

            if (percentage < 100 && percentage > 90)
                grade = "Excellent";
            else if (percentage < 90 && percentage > 80)
                grade = "Good";
            else if (percentage < 80 && percentage > 70)
                grade = "Fair";
            else if (percentage < 70 && percentage > 60)
                grade = "Need to Improve";
            else
                grade = "Fail";

            // displaying information
                Console.WriteLine($"{this.sid} \t {this.name} \t {this.mark1} \t {this.mark2} \t {this.mark3} \t {this.mark4} \t {this.mark5} \t {this.total} \t {this.grade} \n");
            
        }
    }
}
