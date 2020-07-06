import Swift

// 코드 12-5 튜플의 접근수준 부여
internal class InternalClass {}	// 내부 접근수준 클래스
private struct PrivateStruct {} // 비공개 접근수준 구조체

// 요소로 사용되는 InternalClass와 PrivateStruct의 접근수준이
// publicTuple보다 낮기 때문에 사용할 수 없습니다.
public var publicTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())

// 요소로 사용되는 InternalClass와 PrivateStruct의 접근수준이
// privateTuple과 같거나 높기 때문에 사용할 수 있습니다.
private var privateTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())

