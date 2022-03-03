//: [Previous](@previous)

import Foundation

var sisi: Int = 4
var alas: Int = 4
var tinggi: Int = 5
var luasPersegi: Int = sisi * sisi
var luasSegitiga: Int = (alas * tinggi) / 2
var volumePersegi: Int = sisi * sisi * sisi

var x: Int = 16 % 3

func luasPersegi(sisi: Int) -> Int {
    return sisi * sisi
}

luasPersegi(sisi: 6)
