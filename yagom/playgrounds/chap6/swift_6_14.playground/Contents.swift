import Swift

// 코드 6-14 차후에 Menu 열거형에 추가한 case를 처리하지 않으면 경고를 내어줄 @unknown 속성
enum Menu {
    case chicken
    case pizza
    case hamburger
}

let lunchMenu: Menu = .chicken

switch lunchMenu {
case .chicken:
    print("반반 무많이")
case .pizza:
    print("핫소스 많이 주세요")
@unknown case _:
    print("오늘 메뉴가 뭐죠?")
}
