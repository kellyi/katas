#!/usr/bin/env node
// https://programmingpraxis.com/2016/05/10/concatenate-n-n-times/

function concatenateNNtimes(n) {
    return Array(n).join(n.toString());
}

console.log(concatenateNNtimes(12));
