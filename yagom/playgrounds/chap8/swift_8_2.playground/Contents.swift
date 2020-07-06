import Swift

// 코드 8-2 옵셔널 변수의 선언 및 nil 할당
var myName: String? = "yagom"
print(myName)   // yagom
// Optional("yagom")
// 옵셔널 타입의 값을 print 함수를 통해 출력하면
// Optional("yagom")이라고 출력되는 것이 정상입니다
// 다만, 차후의 주석표현의 편의를 위하여
// Optional()은 생략하고 값만 표기하도록 하겠습니다
// 또, 옵셔널 타입의 값을 print 함수의 매개변수로 전달하면
// 컴파일러 경고가 발생할 수 있습니다
// 정상이므로 놀라지 않아도 됩니다

myName = nil

print(myName)   // nil

