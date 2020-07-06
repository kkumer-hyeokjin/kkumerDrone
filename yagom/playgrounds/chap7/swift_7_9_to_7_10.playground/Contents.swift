import Swift

// 코드 7-9 inout 매개변수의 활용
var numbers: [Int] = [1, 2, 3]

func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers[1])       // 2

referenceParameter(&numbers)    // 참조를 표현하기 위해 &를 붙여줍니다.
print(numbers[1])       // 1


// 코드 7-10 반환 값이 없는 함수의 정의와 사용
func sayHelloWorld() {
    print("Hello, world!")
}

sayHelloWorld() // Hello, world!

func sayHello(from myName: String, to name: String) {
    print("Hello \(name)! I'm \(myName).")
}

sayHello(from: "yagom", to: "Mijeong")  // Hello Mijeong! I'm yagom.

func sayGoodbye() -> Void {	// Void를 명시해주어도 상관없습니다.
    print("Good bye")
}

sayGoodbye() // Good bye

