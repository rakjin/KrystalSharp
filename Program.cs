using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

using Parsers;

namespace KrystalSharp
{
    class Program
    {
        static void Main(string[] args)
        {
            FileStream file = null;
            KrystalScanner scanner = null;
            KrystalParser parser = null;

            try
            {
                file = new FileStream("test.kst", FileMode.Open);
                scanner = new KrystalScanner(file);
                parser = new KrystalParser(scanner);
                parser.Parse();

            }
            finally
            {
                file.Close();

                Console.WriteLine("");
                Console.WriteLine("press enter to exit...");
                Console.ReadLine();
            }
        }
    }
}
