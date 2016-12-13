using System;
using System.Collections.Generic;
using System.Linq;

public class ThreesAndFives
{
    static public void Main()
    {
        Console.WriteLine(Enumerable.Range(0, 1000)
                                    .ToArray()
                                    .Where(x => (x % 3 == 0 || x % 5 == 0))
                                    .Sum());
    }
}

