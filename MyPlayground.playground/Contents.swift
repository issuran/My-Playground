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

//---------------------------------------------------------

public func solution(_ N : Int) -> Int {
    let binaryArray = convertToBinary(N)
    var count: Int = 0
    var max: Int = 0
    
    for index in 0...(binaryArray.count - 1) {
        if binaryArray[index] == "1" {
            if count > 0 {
                max = max > count ? max : count
            }
            count = 0
        }
        
        if binaryArray[index] == "0" {
            count = count + 1
        }
    }
    return max
}

func convertToBinary(_ N: Int) -> [Character] {
    let binary = String(N, radix: 2)
    let array = Array(binary)
    print(array)
    return array
}

print(solution(110101))
