import Swift

// 코드 10-12 타입 프로퍼티와 인스턴스 프로퍼티
class AClass {
    
    // 저장 타입 프로퍼티
    static var typeProperty: Int = 0
    
    // 저장 인스턴스 프로퍼티
    var instanceProperty: Int = 0 {
        didSet {
            // Self.typeProperty는
            // AClass.typeProperty와 같은 표현입니다
            Self.typeProperty = instanceProperty + 100
        }
    }
    
    // 연산 타입 프로퍼티
    static var typeComputedProperty: Int {
        get {
            return typeProperty
        }
        
        set {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123

let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)  // 200
print(AClass.typeComputedProperty)  // 200




// 코드 10-13 타입 프로퍼티의 사용
class Account {
    
    static let dollarExchangeRate: Double = 1000.0  // 타입 상수
    
    var credit: Int = 0         // 저장 인스턴스 프로퍼티
    
    var dollarValue: Double {   // 연산 인스턴스 프로퍼티
        get {
            // Self.dollarExchangeRate 는
            // Account.dollarExchangeRate와 같은 표현입니다
            return Double(credit) / Self.dollarExchangeRate
        }
        
        set {
            // Self.dollarExchangeRate는
            // Account.dollarExchangeRate와 같은 표현입니다
            credit = Int(newValue * Account.dollarExchangeRate)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}


