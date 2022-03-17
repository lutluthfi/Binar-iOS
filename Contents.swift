//: [Previous](@previous)

import Foundation

//var greeting = "Hello, playground"
//
////: [Next](@next)
//var numbers = [1,2,3,4,5,6,6,6,7,8,8]
////var x = [1,1, 2,3,4, 5,5]
//
//
//
//var counts: [Int: Int] = [:]
//var rsult: [Any] = []
//
//for item in numbers {
//    counts[item] = (counts[item] ?? 0) + 1
//}
//
//print(counts)
//
//for (key, value) in counts {
//    if(value > 1) {
//        rsult.append(key)
//    }
//}
//
//print(rsult)


//for (id, val) in numbers.enumerated() {
//
//    for id2 in numbers.removeFirst(id + 1) {
//        print(val, id, id2)
//
//    }
//
//
//}


//for i in 0...10{
//    if i % 2 == 0 {
//        print("\(i) adalah genap")
//    }
//    else{
//        print("\(i) adalah ganjil")
//    }
//}
//
//for i in 1...100{
//    if (i % 3 == 0 && i % 5 != 0){
//        print("\(i) adalah fish")
//    }
//    else if (i % 5 == 0 && i % 3 != 0){
//        print("\(i) adalah bass")
//    }
//    else if (i % 5 == 0 && i % 3 == 0){
//        print("\(i) adalah fishbass")
//    }
//}


//[1, 1, 2, 2, 3, 4, 1]
//4
//[[2, 2], [3, 1]]

func sum (_arr: [Int], res: Int) -> Array<Any>{
    var _result: [[Int]]  = []
    for (i, val) in _arr.enumerated() {
        for x in stride(from: i + 1, to: _arr.count, by: +1) {
            if val + _arr[x] == res{
                if(_result.contains([val, _arr[x]].sorted())){
                    continue;

                }
                else{
                    _result.append([val, _arr[x]]);
                }

            }
        }

    }
    return _result
}


print(sum(_arr: [1, 1, 2, 2, 3, 4, 1],res: 5))




