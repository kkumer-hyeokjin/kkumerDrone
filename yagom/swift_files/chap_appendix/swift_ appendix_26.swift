import Swift

// 코드 부록-26 Result 타입의 활용
enum ConvertError: Error {
    case notAnASCII
    case unknown
}

func ascii(_ character: Character) -> Result<UInt8, ConvertError> {
    if let ascii = character.asciiValue {
        return Result.success(ascii)
    } else {
        return Result.failure(ConvertError.notAnASCII)
    }
}

switch ascii("A") {
case .success(let value):
    print(value)
case .failure(let error):
    print(error)
}
// 65

switch ascii("ㄱ") {
case .success(let value):
    print(value)
case .failure(let error):
    print(error)
}
// notAnASCII

print(ascii("A"))   // success(65)
print(ascii("ㄱ"))   // failure(ConvertError.notAnASCII)
