//: [Previous](@previous)
import UIKit
import Foundation

//: [Next](@next)


func asyncFunc() async {
    print("Doing async work")
}


func doRegularWork() {
    Task {
        await asyncFunc()
    }
}

print(doRegularWork())




func fetchNews() async -> Data? {
    do {
        let url = URL(string: "https://hws.dev/news-1.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    } catch {
        print("Failed to fetch data")
        return nil
    }
}

func getData() {
    Task{
        if let data = await fetchNews() {
            print("Downloaded \(data.count) bytes")
        } else {
            print("Download failed.")
        }

    }
}


getData()


func syncFunc() {
    print("Doing sync work")
}


print(syncFunc())
