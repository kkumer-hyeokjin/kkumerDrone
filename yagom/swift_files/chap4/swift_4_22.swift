import Swift

// 코드 4-22 CaseIterable 프로토콜을 활용한 열거형의 항목 순회
enum School: CaseIterable {
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

let allCases: [School] = School.allCases
print(allCases)
// [School.primary, School.elementary, School.middle, School.high, School.college, School.university, School.graduate]
