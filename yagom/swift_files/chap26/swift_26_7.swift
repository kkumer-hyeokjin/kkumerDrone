import Swift

// 코드 26-7 where 절을 활용한 제네릭 타입의 연관 타입 제약 추가
protocol Talkable { }
protocol CallToAll {
    func callToAll()
}

struct Person: Talkable { }
struct Animal { }

extension Array: CallToAll where Element: Talkable {
    func callToAll() { }
}

let people: [Person] = []
let cats: [Animal] = []

people.callToAll()
// cats.callToAll() // 컴파일 오류!
