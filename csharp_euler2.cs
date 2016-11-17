using System;
using System.Collections.Generic;
using System.Linq;

public class SumFibo
{
    static public void Main()
    {
        Console.WriteLine(Solve(4000000));
    }

    private static int Solve(int limit, int first = 1, int second = 2, int acc = 0)
    {
        if (second >= limit)
        {
            return acc;
        }
        else if (second % 2 == 0)
        {
            return Solve(limit, second, first+second, acc+second);
        }
        else
        {
            return Solve(limit, second, first+second, acc);
        }
    }
}