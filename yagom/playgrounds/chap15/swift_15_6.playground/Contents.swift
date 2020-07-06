import Swift

// 코드 15-6 맵과 필터 메서드의 연계 사용
let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let mappedNumbers: [Int] = numbers.map{ $0 + 3 }

let evenNumbers: [Int] = mappedNumbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)  // [4, 6, 8]

// mappedNumbers를 굳이 여러 번 사용할 필요가 없다면 메서드를 체인처럼 연결하여 사용할 수 있습니다.
let oddNumbers: [Int] = numbers.map{ $0 + 3 }.filter{ $0 % 2 == 1 }
print(oddNumbers)   // [3, 5, 7]
