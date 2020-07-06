import Swift
import Foundation

// 코드 부록-20 propertyWrapper 속성의 사용

// 프로퍼티를 텍스트 파일로 읽고 쓰도록 포장할 때 사용할 패턴입니다.
@propertyWrapper
struct TextFileIO {
    
    private var fileLocation: URL
    
    init(fileName: String?) {
        
        let applicationSupportDirectory: URL
        
        do {
            applicationSupportDirectory = try FileManager.default.url(for:
                .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        } catch {
            fatalError("파일경로 생성 실패")
        }
        
        let fileNameToAppend: String
        
        if let fileName = fileName {
            fileNameToAppend = fileName
        } else {
            fileNameToAppend = "file.text"
        }
        
        self.fileLocation = applicationSupportDirectory.appendingPathComponent(fileNameToAppend)
    }
    
    var wrappedValue: String {
        get {
            guard let string = try? String(contentsOf: self.fileLocation, encoding: String.Encoding.utf8) else {
                return ""
            }
            return string
        }
        
        set {
            try? newValue.write(to: self.fileLocation, atomically: true, encoding:
                String.Encoding.utf8) }
    }
}

// TextFileIO 패턴을 적용한 프로퍼티를 사용하는 NoteManager 구조체
struct NoteManager {
    @TextFileIO(fileName: "title.txt")
    var title: String
    
    @TextFileIO(fileName: "contents.txt")
    var contents: String
}

var manager = NoteManager()
print(manager.title) // 다음 실행에서 지난 번 변경 내용이 저장되어 있었는지 확인해봅니다.
manager.title = "title" // 새로운 제목을 파일에 저장합니다.

print(manager.contents) // 다음 실행에서 지난 번 변경 내용이 저장되어 있었는지 확인해봅니다.
manager.contents = "yagom" // 새로운 내용을 파일에 저장합니다.

// 특정 프로퍼티에 할당하는 값이 범위를 벗어나지 않도록 제한하는 패턴을 만들어봅니다.
@propertyWrapper
struct LimitedRange<T: Comparable> {
    
    var value: T
    let range: ClosedRange<T>
    
    init(initialValue: T, range: ClosedRange<T>) { precondition(range.contains(initialValue)) self.value = initialValue
        self.range = range
    }
    
    var wrappedValue: T {
        get {
            return self.value
        }
        mutating set {
            value = max(min(range.upperBound, newValue), range.lowerBound)
        }
        
    }
}
// LimitedRange 패턴을 적용한 프로퍼티를 활용해봅니다.
struct Person {
    let name: String
    @LimitedRange(range: 0...150) var age: Int = 0
}

var yagom: Person = Person(name: "yagom", age: 100)
print(yagom.age)    // 100
yagom.age = -1
print(yagom.age)    // 0
yagom.age = 160
print(yagom.age)    // 150
