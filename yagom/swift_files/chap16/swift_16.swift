import Swift

// 코드 16-1 addThree 함수
func addThree(_ num: Int) -> Int {
    return num + 3
}

// 코드 16-2 일반 값을 연산할 수 있는 addThree 함수
addThree(2) // 5


// 코드 16-3 옵셔널을 연산할 수 없는 addThree 함수
/*
 addThree(Optional(2))   // 오류 발생!
 */


// 코드 16-4 맵 메서드를 사용하여 옵셔널을 연산할 수 있는 addThree(_:) 함수
Optional(2).map(addThree)   // Optional(5)


// 코드 16-5 옵셔널에 맵 메서드와 클로저의 사용
var value: Int? = 2
value.map{ $0 + 3 } // Optional(5)
value = nil
value.map{ $0 + 3 } // nil( ==Optional<Int>.none)


// 코드 16-7 doubledEven(_:) 함수와 플랫맵의 사용
func doubledEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    }
    return nil
}

Optional(3).flatMap(doubledEven)
// nil( ==Optional<Int>.none)


// 코드 16-8 맵과 플랫맵의 차이
let optionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = optionals.map{ $0 }
let compactMapped: [Int] = optionals.compactMap{ $0 }

print(mapped)        // [Optional(1), Optional(2), nil, Optional(5)]
print(compactMapped) // [1, 2, 5]


// 코드 16-9 중첩된 컨테이너에서 맵과 플랫맵의 차이
let multipleContainer = [[1, 2, Optional.none], [3, Optional.none], [4, 5, Optional.none]]

let mappedMultipleContainer = multipleContainer.map{ $0.map{ $0 } }
let flatmappedMultipleContainer = multipleContainer.flatMap{ $0.compactMap{ $0 } }

print(mappedMultipleContainer)        // [[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
print(flatmappedMultipleContainer)    // [1, 2, 3, 4, 5]


// 코드 16-10 플랫맵의 활용
func stringToInteger(_ string: String) -> Int? {
    return Int(string)
}

func integerToString(_ integer: Int) -> String? {
    return "\(integer)"
}

var optionalString: String? = "2"

let flattenResult = optionalString.flatMap(stringToInteger)
    .flatMap(integerToString)
    .flatMap(stringToInteger)

print(flattenResult)   // Optional(2)

let mappedResult = optionalString.map(stringToInteger) // 더 이상 체인 연결 불가

print(mappedResult)   // Optional(Optional(2))


// 코드 16-12 옵셔널 바인딩을 통한 연산
var result: Int?
if let string: String = optionalString {
    if let number: Int = stringToInteger(string) {
        if let finalString: String = integerToString(number) {
            if let finalNumber: Int = stringToInteger(finalString) {
                result = Optional(finalNumber)
            }
        }
    }
}

print(result)   // Optional(2)

if let string: String = optionalString,
    let number: Int = stringToInteger(string),
    let finalString: String = integerToString(number),
    let finalNumber: Int = stringToInteger(finalString) {
    result = Optional(finalNumber)
}

print(result)   // Optional(2)


// 코드 16-13 플랫맵 체이닝 중 빈 컨텍스트를 만났을 때의 결과
func integerToNil(param: Int) -> String? {
    return nil
}

optionalString = "2"

result = optionalString.flatMap(stringToInteger)
    .flatMap(integerToNil)
    .flatMap(stringToInteger)

print(result)   // nil
