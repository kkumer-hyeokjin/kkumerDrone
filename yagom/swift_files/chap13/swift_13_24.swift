import Swift

// 코드 13-24 자동 클로저의 탈출
var customersInLine: [String] = ["minjae", "innoceive", "sopress"]

func returnProvider(_ customerProvider: @autoclosure @escaping () -> String) -> (() -> String) {
    return customerProvider
}

let customerProvider: () -> String = returnProvider(customersInLine.removeFirst())
print("Now serving \(customerProvider())!") // "Now serving minjae!"

