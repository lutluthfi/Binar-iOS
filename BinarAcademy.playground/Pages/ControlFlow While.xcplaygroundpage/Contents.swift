import Foundation

func numberWhile() {
    var index = 1, number = 5
    while (index <= number) {
        print(index)
        index = index + 1
    }
}

func numberRepeatWhile() {
    var index = 1, number = 0
    repeat {
        print(index)
        index = index + 1
    } while (index <= number)
}

func infiniteLoop() {
    while true {
        print("endless loop")
    }
}

func whileArray() {
    var array = [1, 2, 3, 4, 5]
    var index = 0
    while array.count < 8 {
        print(array[index])
        index += 1
    }
    print("finish")
}
