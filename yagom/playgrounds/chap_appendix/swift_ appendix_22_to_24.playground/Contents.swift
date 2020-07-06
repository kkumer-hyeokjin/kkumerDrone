import Foundation

// 코드 부록-22 Codable, JSONEncoder, JSONDecoder의 활용
/// Encodable과 Decodable 프로토콜을 준수하는 타입 Person
struct Person: Codable {
    /// Encodable과 Decodable 프로토콜을 준수하는 타입 Gender
    enum Gender: String, Codable {
        case male, female, unknown
    }
    
    var name: String
    var age: Int
    var gender: Gender
    var friends: [Person]
}

let yagom = Person(name: "yagom", age: 20, gender: .male, friends: [])
let hana = Person(name: "hana", age: 22, gender: .female, friends: [yagom])
let eric = Person(name: "eric", age: 25, gender: .male, friends: [yagom, hana])

// JSONEncoder 인스턴스 생성
var encoder = JSONEncoder()

// JSONEncoder를 활용하여 Person 타입의 eric 인스턴스를 JSON 문자열로 인코딩
let jsonData = try encoder.encode(eric)
let jsonString = String(data: jsonData, encoding: .utf8)
print(jsonString ?? "convert to json string failed")
/*
 "{"age":25,"gender":"male","friends":[{"age":20,"gender":"male","friends":[],"name":"yagom"},{"age":22,"gender":"female","friends":[{"age":20,"gender":"male","friends":[],"name":"yagom"}],"name":"hana"}],"name":"eric"}"
 */

// JSONDecoder를 활용하여 JSON 문자열을 Person 타입의 인스턴스로 디코딩
let decoder = JSONDecoder()
let decoded: Person = try decoder.decode(Person.self, from: jsonData)
print(decoded.name) // eric


// 코드 부록-23 KeyDecodingStrategy와 KeyEncodingStrategy의 활용
struct Car: Codable {
    let wheelCount: Int
    let doorCount: Int
}

var snakeJsonString = "[{\"wheel_count\":4,\"door_count\":4},{\"wheel_count\":6,\"door_count\":2}]"
var snakeJsonData = snakeJsonString.data(using: String.Encoding.utf8)!

let snakeDecoder = JSONDecoder()
snakeDecoder.keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase

let cars = try snakeDecoder.decode([Car].self, from: snakeJsonData)
print(cars.count)   // 2

let snakeEncoder = JSONEncoder()

let nonSnakeJsonData = try snakeEncoder.encode(cars)
let nonSnakeJsonString = String(data: nonSnakeJsonData, encoding: .utf8)
print(nonSnakeJsonString ?? "convert to json string failed")
// [{"doorCount":4,"wheelCount":4},{"doorCount":2,"wheelCount":6}]

snakeEncoder.keyEncodingStrategy = JSONEncoder.KeyEncodingStrategy.convertToSnakeCase

snakeJsonData = try snakeEncoder.encode(cars)
snakeJsonString = String(data: snakeJsonData, encoding: .utf8)!
print(snakeJsonString)
// [{"wheel_count":4,"door_count":4},{"wheel_count":6,"door_count":2}]



// 코드 부록-24 CodingKey의 활용
struct Animal: Codable {
    var species: String
    var age: Int
    var birth: Date
    
    enum CodingKeys : String, CodingKey {
        case species
        case age
        case birth = "date_of_birth"
    }
}

var puppyString = "{\"species\":\"Dog\",\"age\":1,\"date_of_birth\":596300800}"
var puppyData = puppyString.data(using: String.Encoding.utf8)!
let puppyDecoder = JSONDecoder()

let puppy = try puppyDecoder.decode(Animal.self, from: puppyData)
print(puppy.birth)   // 2019-11-24 15:06:40 +0000
