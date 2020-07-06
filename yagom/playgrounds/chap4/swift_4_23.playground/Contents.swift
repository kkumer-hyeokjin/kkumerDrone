import Swift

// 코드 4-23 원시값을 갖는 열거형의 항목 순회
enum School: String, CaseIterable {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let allCases: [School] = School.allCases
print(allCases)
// [School.primary, School.elementary, School.middle, School.high, School.college, School.university, School.graduate]
