import Swift

// 코드 29-1 코드를 통해 메모리에 접근하는 유형
// one이 저장될 메모리 위치에 쓰기 접근
var one: Int = 1

// one이 저장된 메모리 위치에 읽기 접근
print("숫자 출력 : \(one)")


// 코드 29-2 순차적, 순간적 메모리 접근
func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber: Int = 1
myNumber = oneMore(than: myNumber)
print(myNumber)
// 2


// 코드 29-3 입출력 매개변수에서의 메모리 접근 충돌
var step: Int = 1

func increment(_ number: inout Int) {
    number += step
}

//increment(&step)    // 오류 발생!


// 코드 29-4 입출력 매개변수에서의 메모리 접근 충돌 해결
/*
 var step: Int = 1
 var copyOfStep: Int = step
 
 func increment(_ number: inout Int) {
 number += copyOfStep
 }
 
 increment(&step)
 */



// 코드 29-5 복수의 입출력 매개변수로 하나의 변수를 전달하여 메모리 접근 충돌
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore: Int = 42
var playerTwoScore: Int = 30
balance(&playerOneScore, &playerTwoScore) // 문제 없음
//balance(&playerOneScore, &playerOneScore)    // 오류 발생!



// 코드 29-6 게임 캐릭터를 정의한 GamePlayer 구조체
struct GamePlayer {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    
    mutating func restoreHealth() {
        self.health = GamePlayer.maxHealth
    }
    
    mutating func shareHealth(with teammate: inout GamePlayer) {
        balance(&teammate.health, &health)    // balance 함수는 [코드 29-5]에
    }
}


// 코드 29-7 메모리 접근 충돌이 없는 shareHealth(with:) 메서드 호출
var oscar: GamePlayer = GamePlayer(name: "Oscar", health: 10, energy: 10)
var maria: GamePlayer = GamePlayer(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)


// 코드 29-8 메모리 접근 충돌이 발생하는 shareHealth(with:) 메서드 호출
//oscar.shareHealth(with: &oscar)    // 오류 발생!


// 코드 29-9 프로퍼티 접근 중 메모리 접근 충돌
//balance(&oscar.health, &oscar.energy)


// 코드 29-10 전역변수와 지역변수의 메모리 접근의 차이
func someFunction() {
    var oscar = GamePlayer(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)
}
