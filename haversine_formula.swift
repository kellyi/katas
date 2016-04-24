#!/usr/bin/env swift

import Darwin
let radius = 6372.8

func square(n: Double) -> Double {
    return n * n
}

func degToRadians(n: Double) -> Double {
    return n * M_PI/180
}

func greatCircleDistance(start start: (Double, Double), end: (Double, Double)) -> Double {
    let dLat = degToRadians(end.0 - start.0)
    let dLon = degToRadians(end.1 - start.1)
    let startLat = degToRadians(start.0)
    let endLat = degToRadians(end.0)
    let a = square(sin(dLat/2)) + cos(startLat)*cos(endLat)*square(sin(dLon/2))
    return radius * 2 * asin(sqrt(a))
}

let bna = (lat: 36.12, lon: -86.67)
let lax = (lat: 33.94, lon: -118.4)
print(greatCircleDistance(start: bna, end: lax))
