import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(MixedNumberTests.allTests),
    testCase(RationalNumberTests.allTests),
    testCase(RationalNumberSignTests.allTests),
  ]
}
#endif

