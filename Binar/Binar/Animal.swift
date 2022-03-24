//
//  Animal.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 16/03/22.
//

import Foundation

struct Animal: Decodable {
    let name: String
    let photoUrlString: String
    let description: String
    let typeOfFood: TypeOfFood
    let strength: Int
    
    enum TypeOfFood: String, Decodable {
        case carnivora = "carnivora"
        case herbivora = "herbivora"
        case omnivora = "omnivora"
    }
}

extension Animal {
    static func listV1() -> [String] { ["Aardvark","Albatross","Alligator","Alpaca","Ant","Anteater","Antelope","Ape","Armadillo","Donkey","Baboon","Badger","Barracuda","Bat","Bear","Beaver","Bee","Bison","Boar","Buffalo","Butterfly","Camel","Capybara","Caribou","Cassowary","Cat","Caterpillar","Cattle","Chamois","Cheetah","Chicken","Chimpanzee","Chinchilla","Chough","Clam","Cobra","Cockroach","Cod","Cormorant","Coyote","Crab","Crane","Crocodile","Crow","Curlew","Deer","Dinosaur","Dog","Dogfish","Dolphin","Dotterel","Dove","Dragonfly","Duck","Dugong","Dunlin","Eagle","Echidna","Eel","Eland","Elephant","Elk","Emu","Falcon","Ferret","Finch","Fish","Flamingo","Fly","Fox","Frog","Gaur","Gazelle","Gerbil","Giraffe","Gnat","Gnu","Goat","Goldfinch","Goldfish","Goose","Gorilla","Goshawk","Grasshopper","Grouse","Guanaco","Gull","Hamster","Hare","Hawk","Hedgehog","Heron","Herring","Hippopotamus","Hornet","Horse","Human","Hummingbird","Hyena","Ibex","Ibis","Jackal","Jaguar","Jay","Jellyfish","Kangaroo","Kingfisher","Koala","Kookabura","Kouprey","Kudu","Lapwing","Lark","Lemur","Leopard","Lion","Llama","Lobster","Locust","Loris","Louse","Lyrebird","Magpie","Mallard","Manatee","Mandrill","Mantis","Marten","Meerkat","Mink","Mole","Mongoose","Monkey","Moose","Mosquito","Mouse","Mule","Narwhal","Newt","Nightingale","Octopus","Okapi","Opossum","Oryx","Ostrich","Otter","Owl","Oyster","Panther","Parrot","Partridge","Peafowl","Pelican","Penguin","Pheasant","Pig","Pigeon","Pony","Porcupine","Porpoise","Quail","Quelea","Quetzal","Rabbit","Raccoon","Rail","Ram","Rat","Raven","Red deer","Red panda","Reindeer","Rhinoceros","Rook","Salamander","Salmon","Sand Dollar","Sandpiper","Sardine","Scorpion","Seahorse","Seal","Shark","Sheep","Shrew","Skunk","Snail","Snake","Sparrow","Spider","Spoonbill","Squid","Squirrel","Starling","Stingray","Stinkbug","Stork","Swallow","Swan","Tapir","Tarsier","Termite","Tiger","Toad","Trout","Turkey","Turtle","Viper","Vulture","Wallaby","Walrus","Wasp","Weasel","Whale","Wildcat","Wolf","Wolverine","Wombat","Woodcock","Woodpecker","Worm","Wren","Yak","Zebra"]
    }
    
    static func listV2() -> [Animal] {
        let json =
        """
        [
            {
                "name": "Chital",
                "description": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.",
                "photoUrlString": "https://robohash.org/consectetursapientedeserunt.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 214
            },
            {
                "name": "Woodpecker, red-headed",
                "description": "Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\\n\\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\\n\\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.",
                "photoUrlString": "https://robohash.org/etvelitvoluptatum.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 976
            },
            {
                "name": "Sarus crane",
                "description": "Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.",
                "photoUrlString": "https://robohash.org/eligendiullamsequi.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 778
            },
            {
                "name": "Siskin, yellow-rumped",
                "description": "Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\\n\\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.",
                "photoUrlString": "https://robohash.org/ipsaestminima.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 241
            },
            {
                "name": "Falcon, prairie",
                "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\\n\\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\\n\\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
                "photoUrlString": "https://robohash.org/earerumsint.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 254
            },
            {
                "name": "Hoffman's sloth",
                "description": "Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\\n\\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
                "photoUrlString": "https://robohash.org/explicaboeumautem.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 960
            },
            {
                "name": "Monkey, rhesus",
                "description": "Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
                "photoUrlString": "https://robohash.org/maximedoloribusdeleniti.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 260
            },
            {
                "name": "Pie, indian tree",
                "description": "Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\\n\\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.",
                "photoUrlString": "https://robohash.org/veniamevenietet.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 48
            },
            {
                "name": "Eagle, bald",
                "description": "Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\\n\\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\\n\\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.",
                "photoUrlString": "https://robohash.org/doloribusnumquamodit.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 469
            },
            {
                "name": "Squirrel, eurasian red",
                "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\\n\\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\\n\\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
                "photoUrlString": "https://robohash.org/tenetursimiliqueaut.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 668
            },
            {
                "name": "Four-horned antelope",
                "description": "Phasellus in felis. Donec semper sapien a libero. Nam dui.",
                "photoUrlString": "https://robohash.org/providentsuntofficia.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 85
            },
            {
                "name": "Black-winged stilt",
                "description": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\\n\\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.",
                "photoUrlString": "https://robohash.org/corporisconsequaturmollitia.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 470
            },
            {
                "name": "White-faced tree rat",
                "description": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\\n\\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\\n\\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.",
                "photoUrlString": "https://robohash.org/etquidemquae.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 444
            },
            {
                "name": "Phalarope, red-necked",
                "description": "Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\\n\\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\\n\\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.",
                "photoUrlString": "https://robohash.org/ipsamrepudiandaeconsequatur.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 389
            },
            {
                "name": "Burmese brown mountain tortoise",
                "description": "Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\\n\\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.",
                "photoUrlString": "https://robohash.org/sitnonoccaecati.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 834
            },
            {
                "name": "Indian giant squirrel",
                "description": "Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
                "photoUrlString": "https://robohash.org/voluptatemlaudantiumnon.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 775
            },
            {
                "name": "African clawless otter",
                "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\\n\\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\\n\\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
                "photoUrlString": "https://robohash.org/autnumquamnam.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 245
            },
            {
                "name": "Long-tailed spotted cat",
                "description": "Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\\n\\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\\n\\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.",
                "photoUrlString": "https://robohash.org/eaquenonmagni.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 849
            },
            {
                "name": "Oryx, fringe-eared",
                "description": "Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.",
                "photoUrlString": "https://robohash.org/etpossimusreprehenderit.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 300
            },
            {
                "name": "Wallaby, euro",
                "description": "Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\\n\\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.",
                "photoUrlString": "https://robohash.org/reprehenderitnequeid.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 262
            },
            {
                "name": "Great cormorant",
                "description": "Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\\n\\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.",
                "photoUrlString": "https://robohash.org/suntinventoreet.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 54
            },
            {
                "name": "Cat, ringtail",
                "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
                "photoUrlString": "https://robohash.org/quidemearumeum.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 755
            },
            {
                "name": "Tarantula, salmon pink bird eater",
                "description": "Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\\n\\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\\n\\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.",
                "photoUrlString": "https://robohash.org/doloremcumquetemporibus.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 610
            },
            {
                "name": "Cobra, egyptian",
                "description": "Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.",
                "photoUrlString": "https://robohash.org/aliquidvoluptasnon.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 258
            },
            {
                "name": "Rose-ringed parakeet",
                "description": "In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\\n\\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\\n\\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.",
                "photoUrlString": "https://robohash.org/quisquamutaspernatur.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 933
            },
            {
                "name": "Cape starling",
                "description": "Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.",
                "photoUrlString": "https://robohash.org/estverofugit.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 72
            },
            {
                "name": "Jungle cat",
                "description": "Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\\n\\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.",
                "photoUrlString": "https://robohash.org/etautdolorem.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 226
            },
            {
                "name": "Southern boubou",
                "description": "Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.",
                "photoUrlString": "https://robohash.org/doloressaepenatus.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 380
            },
            {
                "name": "Blue crane",
                "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\\n\\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\\n\\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
                "photoUrlString": "https://robohash.org/commodieiusrepellat.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 219
            },
            {
                "name": "Marshbird, brown and yellow",
                "description": "Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\\n\\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.",
                "photoUrlString": "https://robohash.org/magnamblanditiisbeatae.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 584
            },
            {
                "name": "Black vulture",
                "description": "Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.",
                "photoUrlString": "https://robohash.org/dignissimosillumalias.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 538
            },
            {
                "name": "Downy woodpecker",
                "description": "In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.",
                "photoUrlString": "https://robohash.org/repudiandaeenimcumque.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 4
            },
            {
                "name": "White-throated robin",
                "description": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\\n\\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.",
                "photoUrlString": "https://robohash.org/magnamnihilasperiores.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 925
            },
            {
                "name": "Monster, gila",
                "description": "Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.",
                "photoUrlString": "https://robohash.org/quassolutaquaerat.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 963
            },
            {
                "name": "Flamingo, lesser",
                "description": "Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.",
                "photoUrlString": "https://robohash.org/quasdoloribushic.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 202
            },
            {
                "name": "Chuckwalla",
                "description": "Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.",
                "photoUrlString": "https://robohash.org/deseruntiustomaiores.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 43
            },
            {
                "name": "Long-necked turtle",
                "description": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\\n\\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\\n\\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.",
                "photoUrlString": "https://robohash.org/molestiaefacilisdeleniti.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 264
            },
            {
                "name": "Bushpig",
                "description": "Fusce consequat. Nulla nisl. Nunc nisl.",
                "photoUrlString": "https://robohash.org/voluptatemutvel.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 339
            },
            {
                "name": "Macaw, red and blue",
                "description": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\\n\\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.",
                "photoUrlString": "https://robohash.org/voluptassintaspernatur.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 482
            },
            {
                "name": "Butterfly, tropical buckeye",
                "description": "Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\\n\\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.",
                "photoUrlString": "https://robohash.org/etenimnatus.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 232
            },
            {
                "name": "Baboon, savanna",
                "description": "Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\\n\\nPhasellus in felis. Donec semper sapien a libero. Nam dui.",
                "photoUrlString": "https://robohash.org/voluptasetofficiis.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 934
            },
            {
                "name": "Ibis, glossy",
                "description": "Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.",
                "photoUrlString": "https://robohash.org/esseveritatissit.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 70
            },
            {
                "name": "Peregrine falcon",
                "description": "Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\\n\\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.",
                "photoUrlString": "https://robohash.org/etdoloremarchitecto.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 287
            },
            {
                "name": "Worm snake (unidentified)",
                "description": "Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.",
                "photoUrlString": "https://robohash.org/temporanecessitatibusea.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 504
            },
            {
                "name": "Cormorant (unidentified)",
                "description": "Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\\n\\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\\n\\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
                "photoUrlString": "https://robohash.org/blanditiisvitaeex.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 622
            },
            {
                "name": "Nighthawk, common",
                "description": "Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\\n\\nSed ante. Vivamus tortor. Duis mattis egestas metus.\\n\\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.",
                "photoUrlString": "https://robohash.org/saepecorporisautem.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 619
            },
            {
                "name": "Squirrel, eurasian red",
                "description": "Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.",
                "photoUrlString": "https://robohash.org/abullamsint.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 481
            },
            {
                "name": "Red-tailed hawk",
                "description": "Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\\n\\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.",
                "photoUrlString": "https://robohash.org/ametvoluptatibusnostrum.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 43
            },
            {
                "name": "Prehensile-tailed porcupine",
                "description": "Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\\n\\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\\n\\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.",
                "photoUrlString": "https://robohash.org/nullacorporisalias.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 743
            },
            {
                "name": "Fox, blue",
                "description": "Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\\n\\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\\n\\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.",
                "photoUrlString": "https://robohash.org/rationemaximeassumenda.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 218
            },
            {
                "name": "Common dolphin",
                "description": "Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.",
                "photoUrlString": "https://robohash.org/repellatlaudantiumrerum.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 144
            },
            {
                "name": "Golden eagle",
                "description": "Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\\n\\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\\n\\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.",
                "photoUrlString": "https://robohash.org/quamaliquidaspernatur.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 185
            },
            {
                "name": "European red squirrel",
                "description": "Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\\n\\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\\n\\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
                "photoUrlString": "https://robohash.org/enimconsequaturtotam.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 956
            },
            {
                "name": "Dove, little brown",
                "description": "Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\\n\\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.",
                "photoUrlString": "https://robohash.org/omnislaborumnam.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 131
            },
            {
                "name": "Toddy cat",
                "description": "Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\\n\\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.",
                "photoUrlString": "https://robohash.org/accusamuseaconsequatur.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 799
            },
            {
                "name": "Silver-backed jackal",
                "description": "Sed ante. Vivamus tortor. Duis mattis egestas metus.",
                "photoUrlString": "https://robohash.org/magnamnoncumque.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 294
            },
            {
                "name": "Barbet, levaillant's",
                "description": "Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\\n\\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.",
                "photoUrlString": "https://robohash.org/voluptatemipsain.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 367
            },
            {
                "name": "Ring-tailed coatimundi",
                "description": "Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\\n\\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.",
                "photoUrlString": "https://robohash.org/etquiqui.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 171
            },
            {
                "name": "Bee-eater (unidentified)",
                "description": "Phasellus in felis. Donec semper sapien a libero. Nam dui.",
                "photoUrlString": "https://robohash.org/expeditaullammaiores.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 689
            },
            {
                "name": "Indian mynah",
                "description": "Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\\n\\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\\n\\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.",
                "photoUrlString": "https://robohash.org/voluptatesdoloreeveniet.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 604
            },
            {
                "name": "Avocet, pied",
                "description": "Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.",
                "photoUrlString": "https://robohash.org/dolorumodiodolores.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 672
            },
            {
                "name": "Red howler monkey",
                "description": "In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.",
                "photoUrlString": "https://robohash.org/rerumvoluptatumdignissimos.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 216
            },
            {
                "name": "Violet-eared waxbill",
                "description": "Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.",
                "photoUrlString": "https://robohash.org/namadipiscicommodi.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 915
            },
            {
                "name": "White-faced whistling duck",
                "description": "Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
                "photoUrlString": "https://robohash.org/eaquequibusdamnatus.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 669
            },
            {
                "name": "Tern, white-winged",
                "description": "Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\\n\\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.",
                "photoUrlString": "https://robohash.org/temporavelomnis.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 599
            },
            {
                "name": "Rat, arboral spiny",
                "description": "Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
                "photoUrlString": "https://robohash.org/dictautautem.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 422
            },
            {
                "name": "Macaw, red and blue",
                "description": "Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\\n\\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\\n\\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.",
                "photoUrlString": "https://robohash.org/quibusdamvelconsequatur.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 734
            },
            {
                "name": "Snake, tiger",
                "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.",
                "photoUrlString": "https://robohash.org/quiaestfugit.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 711
            },
            {
                "name": "Puna ibis",
                "description": "Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\\n\\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\\n\\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.",
                "photoUrlString": "https://robohash.org/placeatestnihil.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 834
            },
            {
                "name": "Ass, asiatic wild",
                "description": "Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
                "photoUrlString": "https://robohash.org/sequipariaturreiciendis.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 631
            },
            {
                "name": "Green-backed heron",
                "description": "Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\\n\\nSed ante. Vivamus tortor. Duis mattis egestas metus.\\n\\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.",
                "photoUrlString": "https://robohash.org/utveritatiset.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 358
            },
            {
                "name": "Goose, snow",
                "description": "Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\\n\\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\\n\\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
                "photoUrlString": "https://robohash.org/culpaassumendasoluta.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 509
            },
            {
                "name": "Asiatic wild ass",
                "description": "Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\\n\\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\\n\\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.",
                "photoUrlString": "https://robohash.org/nisiutculpa.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 706
            },
            {
                "name": "Indian jackal",
                "description": "Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\\n\\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\\n\\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.",
                "photoUrlString": "https://robohash.org/facilisquiat.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 976
            },
            {
                "name": "Black-backed jackal",
                "description": "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\\n\\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.",
                "photoUrlString": "https://robohash.org/ipsaautculpa.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 729
            },
            {
                "name": "Weaver, chestnut",
                "description": "Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\\n\\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.",
                "photoUrlString": "https://robohash.org/placeatquaeratveniam.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 477
            },
            {
                "name": "Weeper capuchin",
                "description": "Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\\n\\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.",
                "photoUrlString": "https://robohash.org/quiautemnemo.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 881
            },
            {
                "name": "Roadrunner, greater",
                "description": "Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\\n\\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.",
                "photoUrlString": "https://robohash.org/estnumquamnulla.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 532
            },
            {
                "name": "Toddy cat",
                "description": "In congue. Etiam justo. Etiam pretium iaculis justo.",
                "photoUrlString": "https://robohash.org/possimusminimanihil.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 711
            },
            {
                "name": "Mouflon",
                "description": "Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.",
                "photoUrlString": "https://robohash.org/autemquasineque.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 311
            },
            {
                "name": "Indian star tortoise",
                "description": "In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\\n\\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\\n\\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.",
                "photoUrlString": "https://robohash.org/quisautqui.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 982
            },
            {
                "name": "Duck, mountain",
                "description": "Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.",
                "photoUrlString": "https://robohash.org/omnisquianon.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 724
            },
            {
                "name": "Cobra, egyptian",
                "description": "Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.",
                "photoUrlString": "https://robohash.org/commodivoluptaspraesentium.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 801
            },
            {
                "name": "Waterbuck, defassa",
                "description": "Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.",
                "photoUrlString": "https://robohash.org/quipariaturut.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 437
            },
            {
                "name": "Cook's tree boa",
                "description": "Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\\n\\nFusce consequat. Nulla nisl. Nunc nisl.\\n\\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
                "photoUrlString": "https://robohash.org/commodiquaeeos.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 476
            },
            {
                "name": "Wapiti, elk,",
                "description": "Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\\n\\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\\n\\nFusce consequat. Nulla nisl. Nunc nisl.",
                "photoUrlString": "https://robohash.org/aliquidillumea.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 493
            },
            {
                "name": "Golden-mantled ground squirrel",
                "description": "In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\\n\\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\\n\\nSed ante. Vivamus tortor. Duis mattis egestas metus.",
                "photoUrlString": "https://robohash.org/perspiciatismollitiaminus.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 988
            },
            {
                "name": "Hyrax",
                "description": "Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.",
                "photoUrlString": "https://robohash.org/facilispraesentiumquia.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 447
            },
            {
                "name": "Asian water dragon",
                "description": "Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\\n\\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\\n\\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.",
                "photoUrlString": "https://robohash.org/sitetcorrupti.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 236
            },
            {
                "name": "Swamp deer",
                "description": "Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.",
                "photoUrlString": "https://robohash.org/mollitiaveritatislaborum.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 356
            },
            {
                "name": "Black-crowned night heron",
                "description": "Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.",
                "photoUrlString": "https://robohash.org/ametremsequi.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 659
            },
            {
                "name": "Lemur, ring-tailed",
                "description": "Phasellus in felis. Donec semper sapien a libero. Nam dui.\\n\\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.",
                "photoUrlString": "https://robohash.org/enimasperioresrerum.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 419
            },
            {
                "name": "Anteater, australian spiny",
                "description": "Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\\n\\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.",
                "photoUrlString": "https://robohash.org/sedculpaaliquid.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 495
            },
            {
                "name": "Uinta ground squirrel",
                "description": "Phasellus in felis. Donec semper sapien a libero. Nam dui.\\n\\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.",
                "photoUrlString": "https://robohash.org/minimacupiditatenatus.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 436
            },
            {
                "name": "Miner's cat",
                "description": "Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\\n\\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.",
                "photoUrlString": "https://robohash.org/sedestimpedit.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 968
            },
            {
                "name": "Downy woodpecker",
                "description": "Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.",
                "photoUrlString": "https://robohash.org/rerumlaboriosamquia.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 400
            },
            {
                "name": "Armadillo, giant",
                "description": "Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\\n\\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\\n\\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.",
                "photoUrlString": "https://robohash.org/eiusasperioresipsum.png?size=700x700&set=set1",
                "typeOfFood": "omnivora",
                "strength": 707
            },
            {
                "name": "Greylag goose",
                "description": "Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.",
                "photoUrlString": "https://robohash.org/illodignissimospraesentium.png?size=700x700&set=set1",
                "typeOfFood": "herbivora",
                "strength": 797
            },
            {
                "name": "Jackal, black-backed",
                "description": "Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\\n\\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.",
                "photoUrlString": "https://robohash.org/perspiciatisdoloresenim.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 816
            },
            {
                "name": "Grouse, sage",
                "description": "Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\\n\\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\\n\\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.",
                "photoUrlString": "https://robohash.org/inciduntinblanditiis.png?size=700x700&set=set1",
                "typeOfFood": "carnivora",
                "strength": 545
            }
        ]
        """
        do {
            let jsonData = Data(json.utf8)
            let animals: [Animal] = try JSONDecoder().decode([Animal].self, from: jsonData)
            return animals
        } catch {
            print(String(describing: error))
            return []
        }
    }
}
