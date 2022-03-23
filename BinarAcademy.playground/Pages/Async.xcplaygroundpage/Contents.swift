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

struct MyJsonModel: Codable {
    var userId: Int = 0
    var id: Int = 0
    var title: String = "Agus"
    var body: String = "lorem Ipsum"
    
}


func goGrabSomething(completion: @escaping ([MyJsonModel]?, Error?) -> Void) {
    let ourl = URL(string: "https://jsonplaceholder.typicode.com/posts")
    if let url = ourl {
        let req = URLRequest(url: url)
        URLSession.shared.dataTask(with: req) { data, _, err in
            guard let data = data, err == nil else {
                return
            }
            do {
                let model = try JSONDecoder().decode([MyJsonModel].self, from: data)
                DispatchQueue.main.async {
                    completion(model, nil)

                }
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}

goGrabSomething { result, Error in
    guard let data = result else {
        return
    }
    
    print(data[0].title)
}


func goGrabSomethingAsyncAwait() async throws -> MyJsonModel? {
    var model: MyJsonModel? = nil
    let ourl = URL(string: "https://jsonplaceholder.typicode.com/posts")
    if let url = ourl {
        let req = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: req)
        model = try JSONDecoder().decode(MyJsonModel.self, from: data)
    }
    return model
}


async {
    var myModel = try await goGrabSomethingAsyncAwait()
    print("Name: \(myModel.)")
}
