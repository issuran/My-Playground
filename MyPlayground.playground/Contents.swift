import UIKit

struct MyModel: Decodable {
    let name: String
}

struct MyOtherModel: Decodable {
    let otherName: String
}

var data =
"""
{
    "name": "Tiago"
}
""".data(using: .utf8)!


func decode<T: Decodable>(modelType: T.Type) -> T {
    let myStruct = try! JSONDecoder().decode(modelType, from: data)
    return myStruct
}


let model: MyModel = decode(modelType: MyModel.self)
print(model.name)


data = """
{
    "otherName": "Oliveira"
}
""".data(using: .utf8)!

let otherModel: MyOtherModel = decode(modelType: MyOtherModel.self)
print(otherModel.otherName)
