//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Kubus
// Properties/Attributes
// Jumlah sisi
// Panjang sisi
// Warna

// Balok
// Jumlah sisi
// Panjang sisi
// Warna

// Prisma
// Jumlah sisi
// Panjang sisi
// Warna

// Limas
// Jumlah sisi
// Panjang sisi
// Warna

// Struct / Class
// Struct -> pass by value
// Class  -> pass by reference

class BangunDatar {
    let jumlahSisi: Int
    let panjangSisi: Int
    let warna: String
    
    init(jumlahSisi: Int, panjangSisi: Int, warna: String) {
        self.jumlahSisi = jumlahSisi
        self.panjangSisi = panjangSisi
        self.warna = warna
    }
    
    func keliling() -> Int {
        jumlahSisi * panjangSisi
    }
    
    func luas(tinggi: Int? = nil) -> Double {
        if let tinggi = tinggi {
            return Double(panjangSisi * tinggi) / 2.0
        } else {
            return Double(panjangSisi * panjangSisi)
        }
    }
}

//let persegi = BangunDatar(jumlahSisi: 4, panjangSisi: 4, warna: "biru")
//let segitiga = BangunDatar(jumlahSisi: 3, panjangSisi: 5, warna: "biru")
//let segilima = BangunDatar(jumlahSisi: 5, panjangSisi: 10, warna: "biru")
//persegi.keliling()
//persegi.luas()
//segitiga.keliling()
//segitiga.luas(tinggi: 7)
//segilima.keliling()

class Hewan {
    var jumlahKaki: Int
    var berkembangbiak: String
    var alatGerak: String
    var jenisMakanan: String
    
    init(jumlahKaki: Int, berkembangbiak: String, alatGerak: String, jenisMakanan: String) {
        self.jumlahKaki = jumlahKaki
        self.berkembangbiak = berkembangbiak
        self.alatGerak = alatGerak
        self.jenisMakanan = jenisMakanan
    }
}

class Person {
    var firstName: String = ""
    var lastName: String = ""
    var nickName: String = ""
    var address: String = ""
    var age: Int = 0
    var dob: Date = Date()
    var zodiac: String = ""
    var study: String = ""
    var gender: String = ""
    
    var fullName: String { "\(firstName) \(lastName)" }
}

var people: [Person] = []

let arif = Person()
arif.firstName = "arif"
arif.lastName = "luthfiansyah"
arif.fullName

struct Human {
    var firstName: String = ""
    var lastName: String = ""
    var nickName: String = ""
    var address: String = ""
    var age: Int = 0
    var dob: Date = Date()
    var zodiac: String = ""
    var study: String = ""
    var gender: String = ""
    
    var fullName: String { "\(firstName) \(lastName)" }
}

var luthfi = Human()
luthfi.firstName = "arif"
luthfi.lastName = "luthfiansyah"
