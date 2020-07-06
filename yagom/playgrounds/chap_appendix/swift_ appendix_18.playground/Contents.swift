import Swift

// 코드 부록-18 dynamicMemberLookup 속성의 사용
@dynamicMemberLookup
struct Contacts {
    private let contacts: [String: String] = ["yagom": "010-1234-4567",
                                              "hana": "010-5544-5568"]
    subscript(dynamicMember member: String) -> String {
        return contacts[member] ?? "114"
    }
}
let contacts: Contacts = Contacts()

// Dynamic Member Lookup 사용
let hanas: String = contacts.hana
print(hanas)    // "010-5544-5568"

// 서브스크립트 직접 호출
let yagoms: String = contacts[dynamicMember: "yagom"]
print(yagoms)   // "010-1234-4567"

// 찾을 수 없는 경우
let somebody: String = contacts.somebody
print(somebody) // "114"

let anybody: String = contacts[dynamicMember: "anybody"]
print(anybody)  // "114"
