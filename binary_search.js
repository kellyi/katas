#!/usr/bin/env node
// https://programmingpraxis.com/2016/04/29/binary-search-2/

function binarySearch(list, element, left, right) {
    if (right < left) { return -1 };
    if (left === undefined) { left = 0 };
    if (right === undefined) { right = list.length - 1 };
    const middle = (left + right) / 2 | 0;
    if (list[middle] > element) {
        return binarySearch(list, element, left, middle - 1)
    } else if (list[middle] < element) {
        return binarySearch(list, element, middle + 1, right)
    } else if (list[middle] === element) {
        return middle;
    }
}

const list = [-10,-5,-1,0,1,5,10,100,555,1000];
console.log(binarySearch(list,0) === list.indexOf(0));
console.log(binarySearch(list,11) === list.indexOf(11));
