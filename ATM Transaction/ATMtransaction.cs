using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessSpecifierDemo
{
    class ATMtransaction
    {
        static void Main(string[] args)
        {
            int acc_balance = 10000;
            int deposit, withdrawal, atm_pin = 0;
            int ch;

            Console.WriteLine("Enter 4-digit PIN to start transaction: ");
            atm_pin = Convert.ToInt32(Console.ReadLine());
            if (atm_pin != 1234)
            {
                Console.WriteLine("INCORRECT PIN ENTERED");
                Console.ReadLine();
            }
            else
            {
                while (true)
                {
                    Console.WriteLine("\n WELCOME TO ABC BANK: \n 1. Current Balance \n 2. Withdrawal \n 3. Desposit \n 4. Cancel \n\n ENTER YOUR CHOICE:");
                    ch = Convert.ToInt32(Console.ReadLine());
                    switch (ch)
                    {
                        case 1:
                            Console.WriteLine($"YOUR CURRENT BALANCE IS ₹ {acc_balance}");
                            break;
                        case 2:
                            Console.Write("ENTER WITHDRAW AMOUNT ₹ ");
                            withdrawal = Convert.ToInt32(Console.ReadLine());
                            if (withdrawal > acc_balance)
                                Console.WriteLine("Insufficient Balance");
                            else
                                acc_balance = acc_balance - withdrawal;
                            Console.WriteLine($"PLEASE COLLECT YOUR CASH \n CURRENT BALANCE IS ₹ {acc_balance}");
                            break;
                        case 3:
                            Console.Write("ENTER DEPOSIT AMOUNT ₹ ");
                            deposit = Convert.ToInt32(Console.ReadLine());
                            acc_balance = acc_balance + deposit;
                            Console.WriteLine($"YOUR AMOUNT HAS BEEN DEPOSITED SUCCESSFULLY \n YOUR TOTAL BALANCE IS ₹ {acc_balance}");
                            break;
                        case 4:
                            Console.WriteLine("THANKYOU... \n THANKS FOR USING ABCATM SERVICE");
                            break;
                    }
                }

            }
        }
    }
}
