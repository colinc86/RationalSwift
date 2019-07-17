import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(ComplexFractionTests.allTests),
    testCase(MixedNumberTests.allTests),
    testCase(RationalNumberTests.allTests),
    testCase(RationalNumberSignTests.allTests),
  ]
}
#endif

