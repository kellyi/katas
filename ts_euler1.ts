import * as R from 'ramda';

function solve(maxValue: number): number {
    return R.sum(R.map((n: number) => (n % 5 == 0 || n % 3 == 0) ? n : 0,
        R.range(1, maxValue)));
}

console.log(solve(1000));
