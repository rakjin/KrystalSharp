using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Parsers
{
    internal partial class KrystalParser
    {
        public KrystalParser() : base(null) { }

        public void Parse(string s)
        {
            byte[] inputBuffer = System.Text.Encoding.Default.GetBytes(s);
            MemoryStream stream = new MemoryStream(inputBuffer);
            this.Scanner = new KrystalScanner(stream);
            this.Parse();
        }
    }
}
