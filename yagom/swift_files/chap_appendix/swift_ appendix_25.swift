import Swift

// 코드 부록-25 CaseIterable 프로토콜의 사용
enum Day: String, CaseIterable {
    case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금"
    case sat = "토", sun = "일"
}

// Day.allCases == [.mon, .tue, .wed, .thu, .fri, .sat, .sun]
for day in Day.allCases {
    print(day, terminator: " ")
}
// mon tue wed thu fri sat sun

if let dayOfClean = Day.allCases.randomElement() {
    print("\n청소하는 날 : \(dayOfClean.rawValue)")
    // 청소하는 날 : 목
}
