import Swift

// 코드 부록-19 dynamicCallable 속성의 사용
@dynamicCallable
struct Contacts {
    private let contacts: [String: String] = ["yagom": "010-1234-4567",
                                              "hana": "010-5544-5568"]
    
    func dynamicallyCall(withArguments names: [String]) -> [String] {
        var result: [String] = []
        for name in names {
            guard let mobile: String = contacts[name] else {
                continue
            }
            result.append(mobile)
        }
        return result
    }
}

let contacts: Contacts = Contacts()
var mobiles: [String]

// Dynamic Member Lookup 사용
mobiles = contacts("yagom", "hana")
print(mobiles)  // ["010-1234-4567", "010-5544-5568"]
mobiles = contacts("you", "yagom", "me")
print(mobiles)  // ["010-1234-4567"]

@dynamicCallable
struct Repeater {
    func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Int>) -> String {
        return pairs
            .map { label, count in
                repeatElement(label, count: count).joined(separator: " ")
        }
        .joined(separator: "\n")
    }
}

let repeatLabels: Repeater = Repeater()
print(repeatLabels(yagom: 1, hana: 2))
// yagom
// hana hana
