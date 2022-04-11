//
//  CoffeeShop.swift
//  Binar
//
//  Created by Adji Firmansyah on 4/3/22.
//

import Foundation

protocol ProtocolHotCoffee {
  var name: String { get set }
  var photoUrlString: String { get set }
  var descCoffee: String { get set }
  var price: String { get set }
  var stock: Int { get set }
}

protocol ProtocolCold: ProtocolHotCoffee {
  var name: String { get set }
  var photoUrlString: String { get set }
  var descCoffee: String { get set }
  var price: String { get set }
  var stock: Int { get set }
}

protocol ProtocolOthers: ProtocolCold {
  var name: String { get set }
  var photoUrlString: String { get set }
  var descCoffee: String { get set }
  var price: String { get set }
  var stock: Int { get set }
}

struct HotCoffee: ProtocolHotCoffee, Decodable {
  var name: String
  var photoUrlString: String
  var descCoffee: String
  var price: String
  var stock: Int
  
  enum CodingKeys: String, CodingKey {
    case name
    case photoUrlString
    case descCoffee = "description"
    case price
    case stock
  }
  init(name: String, url: String, desc: String, price: String, stock: Int) {
    self.name = name
    self.photoUrlString = url
    self.descCoffee = desc
    self.price = price
    self.stock = stock
  }
}

struct ColdCoffee: ProtocolCold, Decodable {
  var name: String
  var photoUrlString: String
  var descCoffee: String
  var price: String
  var stock: Int
  
  enum CodingKeys: String, CodingKey {
    case name
    case photoUrlString
    case descCoffee = "description"
    case price
    case stock
  }
  init(name: String, url: String, desc: String, price: String, stock: Int) {
    self.name = name
    self.photoUrlString = url
    self.descCoffee = desc
    self.price = price
    self.stock = stock
  }
}

struct Others: ProtocolOthers, Decodable {
  var name: String
  var photoUrlString: String
  var descCoffee: String
  var price: String
  var stock: Int
  
  enum CodingKeys: String, CodingKey {
    case name
    case photoUrlString
    case descCoffee = "description"
    case price
    case stock
  }
  init(name: String, url: String, desc: String, price: String, stock: Int) {
    self.name = name
    self.photoUrlString = url
    self.descCoffee = desc
    self.price = price
    self.stock = stock
  }
}

struct CoffeeShop: Decodable {
  let urlMainImage: String
  let hotCoffee: [HotCoffee]
  let coldCoffee: [ColdCoffee]
  let others: [Others]
}

extension CoffeeShop {
  
  static func listCoffe() -> CoffeeShop {
    
    let json =
      """
    {
    "urlMainImage": "https://i0.wp.com/tamandelta.com/wp-content/uploads/2020/02/Tempat-Ngopi-di-Semarang-yang-Instagramable-Semasa.jpg",
    "hotCoffee":
    [
        {
            "name": "Americano",
            "description": "Jenis minuman kopi yang keempat adalah americano. Dengan rasa yang mirip dengan kopi hitam, americano terdiri dari espresso shot yang diencerkan dengan air panas. Tips profesional khusus untuk Anda yang ingin membuat americano sendiri di rumah ialah, tuangkan espresso terlebih dahulu, baru tambahkan air panas.",
            "photoUrlString": "https://i2.wp.com/www.teacoffeecup.com/wp-content/uploads/2020/08/classic-americano-espresso.jpg",
            "price": "25.000",
            "stock": 10
        },
        {
            "name": "Latte",
            "description": "Jenis minuman kopi yang kedua adalah latte. Sebagai minuman kopi paling populer di dunia, latte terdiri dari espresso dan steamed milk dengan sedikit busa di atasnya. Latte bisa dipesan dalam bentuk dan rasa originalnya, atau dengan tambahan perasa mulai dari vanilla hingga kayu manis. Latte juga terkenal dengan latte art-nya, yakni seni menggambar bentuk atau pola di atas busa minuman ini.",
            "photoUrlString": "https://media-cdn.tripadvisor.com/media/photo-m/1280/18/c0/ab/c5/hot-caramel-macchiato.jpg?h=300",
            "price": "25.000",
            "stock": 10
        },
        {
            "name": "Cappuccino",
            "description": "Jenis minuman kopi yang ketiga adalah cappuccino. Cappuccino adalah latte yang dibuat dengan lebih banyak busa (foam) daripada steamed milk, seringkali ditambah dengan taburan bubuk kakao atau kayu manis di atasnya. Terdapat juga variasi cappuccino yang menggunakan krim sebagai pengganti susu atau yang memberikan penambah rasa.",
            "photoUrlString": "https://s-ecom.ottenstatic.com/original/602738bcea11c752211252.jpg?h=300",
            "price": "25.000",
            "stock": 25
        },
        {
            "name": "Espresso",
            "description": "Jenis minuman kopi yang kelima adalah espresso. Espresso adalah jenis minuman kopi yang sangat pekat. Meski sederhana dalam penampilan, espresso cenderung sulit untuk diminum bagi pemula karena rasanya yang pahit dan kental. Minuman espresso dapat disajikan sendiri atau digunakan sebagai dasar dari sebagian besar jenis minuman kopi, seperti latte dan macchiatos.",
            "photoUrlString": "https://www.baristamagazine.com/wp-content/uploads/2021/08/paje-victoria-aBX4eb7zNBo-unsplash-550x687.jpg?h=300",
            "price": "20.000",
            "stock": 15
        },
        {
            "name": "Hot Caramel Macchiato ",
            "description": "Jenis minuman kopi yang kesembilan adalah macchiato. Macchiato adalah jenis minuman kopi berbasis espresso lainnya yang memiliki sedikit busa di atasnya. Kata 'macchiato' berarti tanda atau noda. Ini mengacu pada tanda bahwa steamed milk meninggalkan permukaan espresso saat dituangkan ke dalam minuman. Sirup perasa sering ditambahkan ke jenis minuman kopi ini, sesuai dengan preferensi pelanggan.",
            "photoUrlString": "https://media-cdn.tripadvisor.com/media/photo-m/1280/18/c0/ab/c5/hot-caramel-macchiato.jpg",
            "price": "23.000",
            "stock": 20
        },
        {
            "name": "Mochaccino",
            "description": "Jenis minuman kopi yang kesepuluh adalah mocha. Mocha adalah jenis minuman kopi yang pas bagi Anda pecinta cokelat. Mocha adalah jenis minuman kopi yang terdiri dari espresso, coklat, steamed milk dan foam. Mocha adalah perpaduan unik kopi dan cokelat panas. Bubuk atau sirup coklat memberikan rasa yang kaya dan lembut serta mengurangi keasaman espresso pada jenis minuman kopi satu ini.",
            "photoUrlString": "https://coffeeaffection.com/wp-content/uploads/2021/02/what-is-mocha.jpg?h=300",
            "price": "23.000",
            "stock": 15
        }
    ],
    "coldCoffee":
    [
        {
            "name": "Cold Americano",
            "description": "Jenis minuman kopi yang keempat adalah americano. Dengan rasa yang mirip dengan kopi hitam, americano terdiri dari espresso shot yang diencerkan dengan air panas. Tips profesional khusus untuk Anda yang ingin membuat americano sendiri di rumah ialah, tuangkan espresso terlebih dahulu, baru tambahkan air panas.",
            "photoUrlString": "https://i2.wp.com/www.teacoffeecup.com/wp-content/uploads/2020/08/classic-americano-espresso.jpg",
            "price": "25.000",
            "stock": 10
        },
        {
            "name": "Cold Latte",
            "description": "Jenis minuman kopi yang kedua adalah latte. Sebagai minuman kopi paling populer di dunia, latte terdiri dari espresso dan steamed milk dengan sedikit busa di atasnya. Latte bisa dipesan dalam bentuk dan rasa originalnya, atau dengan tambahan perasa mulai dari vanilla hingga kayu manis. Latte juga terkenal dengan latte art-nya, yakni seni menggambar bentuk atau pola di atas busa minuman ini.",
            "photoUrlString": "https://media-cdn.tripadvisor.com/media/photo-s/18/98/a9/e0/vanilla-latte-our-vanilla.jpg",
            "price": "25.000",
            "stock": 10
        },
        {
            "name": "Cold Cappuccino",
            "description": "Jenis minuman kopi yang ketiga adalah cappuccino. Cappuccino adalah latte yang dibuat dengan lebih banyak busa (foam) daripada steamed milk, seringkali ditambah dengan taburan bubuk kakao atau kayu manis di atasnya. Terdapat juga variasi cappuccino yang menggunakan krim sebagai pengganti susu atau yang memberikan penambah rasa.",
            "photoUrlString": "https://s-ecom.ottenstatic.com/original/602738bcea11c752211252.jpg",
            "price": "25.000",
            "stock": 25
        },
        {
            "name": "Cold Espresso",
            "description": "Jenis minuman kopi yang kelima adalah espresso. Espresso adalah jenis minuman kopi yang sangat pekat. Meski sederhana dalam penampilan, espresso cenderung sulit untuk diminum bagi pemula karena rasanya yang pahit dan kental. Minuman espresso dapat disajikan sendiri atau digunakan sebagai dasar dari sebagian besar jenis minuman kopi, seperti latte dan macchiatos.",
            "photoUrlString": "https://www.baristamagazine.com/wp-content/uploads/2021/08/paje-victoria-aBX4eb7zNBo-unsplash-550x687.jpg",
            "price": "20.000",
            "stock": 15
        },
        {
            "name": "Cold Caramel Macchiato ",
            "description": "Jenis minuman kopi yang kesembilan adalah macchiato. Macchiato adalah jenis minuman kopi berbasis espresso lainnya yang memiliki sedikit busa di atasnya. Kata 'macchiato' berarti tanda atau noda. Ini mengacu pada tanda bahwa steamed milk meninggalkan permukaan espresso saat dituangkan ke dalam minuman. Sirup perasa sering ditambahkan ke jenis minuman kopi ini, sesuai dengan preferensi pelanggan.",
            "photoUrlString": "https://media-cdn.tripadvisor.com/media/photo-m/1280/18/c0/ab/c5/hot-caramel-macchiato.jpg",
            "price": "23.000",
            "stock": 20
        },
        {
            "name": "Cold Mochaccino",
            "description": "Jenis minuman kopi yang kesepuluh adalah mocha. Mocha adalah jenis minuman kopi yang pas bagi Anda pecinta cokelat. Mocha adalah jenis minuman kopi yang terdiri dari espresso, coklat, steamed milk dan foam. Mocha adalah perpaduan unik kopi dan cokelat panas. Bubuk atau sirup coklat memberikan rasa yang kaya dan lembut serta mengurangi keasaman espresso pada jenis minuman kopi satu ini.",
            "photoUrlString": "https://coffeeaffection.com/wp-content/uploads/2021/02/what-is-mocha.jpg",
            "price": "23.000",
            "stock": 15
        }
    ],
    "others":
    [
        {
            "name": "Seblak",
            "description": "Jenis minuman kopi yang keempat adalah americano. Dengan rasa yang mirip dengan kopi hitam, americano terdiri dari espresso shot yang diencerkan dengan air panas. Tips profesional khusus untuk Anda yang ingin membuat americano sendiri di rumah ialah, tuangkan espresso terlebih dahulu, baru tambahkan air panas.",
            "photoUrlString": "https://i2.wp.com/www.teacoffeecup.com/wp-content/uploads/2020/08/classic-americano-espresso.jpg",
            "price": "25.000",
            "stock": 10
        },
        {
            "name": "Telor ceplok",
            "description": "Jenis minuman kopi yang kedua adalah latte. Sebagai minuman kopi paling populer di dunia, latte terdiri dari espresso dan steamed milk dengan sedikit busa di atasnya. Latte bisa dipesan dalam bentuk dan rasa originalnya, atau dengan tambahan perasa mulai dari vanilla hingga kayu manis. Latte juga terkenal dengan latte art-nya, yakni seni menggambar bentuk atau pola di atas busa minuman ini.",
            "photoUrlString": "https://media-cdn.tripadvisor.com/media/photo-s/18/98/a9/e0/vanilla-latte-our-vanilla.jpg",
            "price": "25.000",
            "stock": 10
        },
        {
            "name": "Telor gulung",
            "description": "Jenis minuman kopi yang ketiga adalah cappuccino. Cappuccino adalah latte yang dibuat dengan lebih banyak busa (foam) daripada steamed milk, seringkali ditambah dengan taburan bubuk kakao atau kayu manis di atasnya. Terdapat juga variasi cappuccino yang menggunakan krim sebagai pengganti susu atau yang memberikan penambah rasa.",
            "photoUrlString": "https://s-ecom.ottenstatic.com/original/602738bcea11c752211252.jpg",
            "price": "25.000",
            "stock": 25
        },
        {
            "name": "Kentang goreng",
            "description": "Jenis minuman kopi yang kelima adalah espresso. Espresso adalah jenis minuman kopi yang sangat pekat. Meski sederhana dalam penampilan, espresso cenderung sulit untuk diminum bagi pemula karena rasanya yang pahit dan kental. Minuman espresso dapat disajikan sendiri atau digunakan sebagai dasar dari sebagian besar jenis minuman kopi, seperti latte dan macchiatos.",
            "photoUrlString": "https://www.baristamagazine.com/wp-content/uploads/2021/08/paje-victoria-aBX4eb7zNBo-unsplash-550x687.jpg",
            "price": "20.000",
            "stock": 15
        },
        {
            "name": "Cimin",
            "description": "Jenis minuman kopi yang kesembilan adalah macchiato. Macchiato adalah jenis minuman kopi berbasis espresso lainnya yang memiliki sedikit busa di atasnya. Kata 'macchiato' berarti tanda atau noda. Ini mengacu pada tanda bahwa steamed milk meninggalkan permukaan espresso saat dituangkan ke dalam minuman. Sirup perasa sering ditambahkan ke jenis minuman kopi ini, sesuai dengan preferensi pelanggan.",
            "photoUrlString": "https://media-cdn.tripadvisor.com/media/photo-m/1280/18/c0/ab/c5/hot-caramel-macchiato.jpg",
            "price": "23.000",
            "stock": 20
        },
        {
            "name": "Cireng",
            "description": "Jenis minuman kopi yang kesepuluh adalah mocha. Mocha adalah jenis minuman kopi yang pas bagi Anda pecinta cokelat. Mocha adalah jenis minuman kopi yang terdiri dari espresso, coklat, steamed milk dan foam. Mocha adalah perpaduan unik kopi dan cokelat panas. Bubuk atau sirup coklat memberikan rasa yang kaya dan lembut serta mengurangi keasaman espresso pada jenis minuman kopi satu ini.",
            "photoUrlString": "https://coffeeaffection.com/wp-content/uploads/2021/02/what-is-mocha.jpg",
            "price": "23.000",
            "stock": 15
        }
    ]
    }

    """
    do {
      let jsonData = Data(json.utf8)
      let coffee: CoffeeShop = try JSONDecoder().decode(CoffeeShop.self, from: jsonData)
      return coffee
    } catch {
      print(String(describing: error))
      return CoffeeShop(urlMainImage: "",
                        hotCoffee: [HotCoffee(name: "", url: "", desc: "", price: "0", stock: 0)],
                        coldCoffee: [ColdCoffee(name: "", url: "", desc: "", price: "0", stock: 0)],
                        others: [Others(name: "", url: "", desc: "", price: "0", stock: 0)])
    }
    
  }
  
}
