import Swift

// 코드 부록-6 라인 제어 구문과 컴파일 시점 진단 구문의 사용
import Swift

print("\(#file) 파일의 \(#line)번 줄에서 실행되고 있습니다.")
// example.swift 파일의 3번 줄에서 실행되고 있습니다.

#sourceLocation(file: "mine.swift", line: 100)
func printDebugInfo() {
    print("\(#file) 파일의 \(#line)번 줄, \(#column)번 칸이고, \(#function) 함수 안에서 실행되고 있습니다.")
}

printDebugInfo()
// mine.swift 파일의 101번 줄, 50번 칸이고, printDebugInfo() 함수 안에서 실행되고 있습니다.

#sourceLocation()

print("\(#file) 파일의 \(#line)번 줄에서 실행되고 있습니다.")
// example.swift 파일의 25번 줄에서 실행되고 있습니다.


#warning("여기에 작성할 코드가 있을텐데요! 혹시 잊은 것이 없는지 확인해보세요!")
#error("여기에 코드 작성 안하면 오류가 발생해요!")
