//
// RationalNumberTests.swift
// RationalSwift Copyright (c) 2019 Colin Campbell
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
// OR OTHER DEALINGS IN THE SOFTWARE.
//

import XCTest
@testable import RationalSwift

final class RationalNumberTests: XCTestCase {
  
  // MARK: RationalNumber protocol
  
  func testMaxValue() {
    let r = Rational(numerator: UInt.max, denominator: 1)
    let m = Rational.max
    assertRationalsEqual(r, m)
  }
  
  func testMinValue() {
    let r = Rational(numerator: UInt.max, denominator: 1, sign: .minus)
    let m = Rational.min
    assertRationalsEqual(r, m)
  }
  
  func testLeastNonzeroMagnitudeValue() {
    let r = Rational(numerator: 1, denominator: UInt.max)
    let m = Rational.leastNonzeroMagnitude
    assertRationalsEqual(r, m)
  }
  
  func testNaNValue() {
    let r = Rational(numerator: 1, denominator: 0)
    let m = Rational.nan
    assertRationalsEqual(r, m)
  }
  
  func testDoubleValue_01() {
    // Test the negative case
    let r = Rational(numerator: 1, denominator: 2, sign: .minus)
    XCTAssertEqual(r.doubleValue, -0.5)
  }
  
  func testDoubleValue_02() {
    // Test the zero/negative case
    let r = Rational(numerator: 0, denominator: 2, sign: .minus)
    XCTAssertEqual(r.doubleValue, 0.0)
  }
  
  func testDoubleValue_03() {
    // Test the zero/positive case
    let r = Rational(numerator: 0, denominator: 2, sign: .plus)
    XCTAssertEqual(r.doubleValue, 0.0)
  }
  
  func testDoubleValue_04() {
    // Test the positive case
    let r = Rational(numerator: 1, denominator: 2, sign: .plus)
    XCTAssertEqual(r.doubleValue, 0.5)
  }
  
  func testFloatValue_01() {
    // Test the negative case
    let r = Rational(numerator: 1, denominator: 2, sign: .minus)
    XCTAssertEqual(r.floatValue, -0.5)
  }
  
  func testFloatValue_02() {
    // Test the zero/negative case
    let r = Rational(numerator: 0, denominator: 2, sign: .minus)
    XCTAssertEqual(r.floatValue, 0.0)
  }
  
  func testFloatValue_03() {
    // Test the zero/positive case
    let r = Rational(numerator: 0, denominator: 2, sign: .plus)
    XCTAssertEqual(r.floatValue, 0.0)
  }
  
  func testFloatValue_04() {
    // Test the positive case
    let r = Rational(numerator: 1, denominator: 2, sign: .plus)
    XCTAssertEqual(r.floatValue, 0.5)
  }
  
  func testIsNaNValue() {
    let r = Rational(numerator: 1, denominator: 0)
    XCTAssertTrue(r.isNaN)
  }
  
  func testIsNotNaNValue() {
    let r = Rational(numerator: 0, denominator: 0)
    XCTAssertFalse(r.isNaN)
  }
  
  func testIsUndefinedValue() {
    let r = Rational(numerator: 0, denominator: 0)
    XCTAssertTrue(r.isUndefined)
  }
  
  func testIsNotUndefinedValue() {
    let r = Rational(numerator: 1, denominator: 0)
    XCTAssertFalse(r.isUndefined)
  }
  
  func testIsZero_01() {
    let r = Rational(numerator: 0, denominator: 1, sign: .minus)
    XCTAssertTrue(r.isZero)
  }
  
  func testIsZero_02() {
    let r = Rational(numerator: 0, denominator: 1, sign: .plus)
    XCTAssertTrue(r.isZero)
  }
  
  func testIsNotZero_01() {
    let r = Rational(numerator: 0, denominator: 0)
    XCTAssertFalse(r.isZero)
  }
  
  func testIsNotZero_02() {
    let r = Rational(numerator: 1, denominator: 0)
    XCTAssertFalse(r.isZero)
  }
  
  func testIsProper_01() {
    let r = Rational(numerator: 1, denominator: 2, sign: .minus)
    XCTAssertTrue(r.isProper)
  }
  
  func testIsProper_02() {
    let r = Rational(numerator: 1, denominator: 2, sign: .plus)
    XCTAssertTrue(r.isProper)
  }
  
  func testIsProper_03() {
    XCTAssertTrue(Rational.zero.isProper)
  }
  
  func testIsNotProper_01() {
    let r = Rational(numerator: 3, denominator: 2, sign: .minus)
    XCTAssertFalse(r.isProper)
  }
  
  func testIsNotProper_02() {
    let r = Rational(numerator: 2, denominator: 2, sign: .minus)
    XCTAssertFalse(r.isProper)
  }
  
  func testIsNotProper_03() {
    let r = Rational(numerator: 2, denominator: 2, sign: .plus)
    XCTAssertFalse(r.isProper)
  }
  
  func testIsNotProper_04() {
    let r = Rational(numerator: 3, denominator: 2, sign: .plus)
    XCTAssertFalse(r.isProper)
  }
  
  func testInitWithIntegerLiteralType_01() {
    let r1 = Rational(numerator: -1, denominator: 2)
    let r2 = Rational(numerator: 1, denominator: 2, sign: .minus)
    assertRationalsEqual(r1, r2)
  }
  
  func testInitWithIntegerLiteralType_02() {
    let r1 = Rational(numerator: 1, denominator: -2)
    let r2 = Rational(numerator: 1, denominator: 2, sign: .minus)
    assertRationalsEqual(r1, r2)
  }
  
  func testInitWithIntegerLiteralType_03() {
    let r1 = Rational(numerator: -1, denominator: -2)
    let r2 = Rational(numerator: 1, denominator: 2, sign: .plus)
    assertRationalsEqual(r1, r2)
  }
  
  func testInitWithIntegerLiteralType_04() {
    let r1 = Rational(numerator: 1, denominator: 2)
    let r2 = Rational(numerator: 1, denominator: 2, sign: .plus)
    assertRationalsEqual(r1, r2)
  }
  
  func testReduce_01() {
    let r1 = Rational(numerator: -15, denominator: 30)
    let r2 = Rational(numerator: 1, denominator: 2, sign: .minus)
    assertRationalsEqual(r1.reduced(), r2)
  }
  
  func testReduce_02() {
    let r1 = Rational(numerator: -15, denominator: 31)
    let r2 = Rational(numerator: 15, denominator: 31, sign: .minus)
    assertRationalsEqual(r1.reduced(), r2)
  }
  
  func testReduce_03() {
    let r1 = Rational(numerator: -15, denominator: 15)
    let r2 = Rational(numerator: 1, denominator: 1, sign: .minus)
    assertRationalsEqual(r1.reduced(), r2)
  }
  
  func testReduce_04() {
    let r1 = Rational(numerator: 15, denominator: 30)
    let r2 = Rational(numerator: 1, denominator: 2, sign: .plus)
    assertRationalsEqual(r1.reduced(), r2)
  }
  
  func testReduce_05() {
    let r1 = Rational(numerator: 15, denominator: 31)
    let r2 = Rational(numerator: 15, denominator: 31, sign: .plus)
    assertRationalsEqual(r1.reduced(), r2)
  }
  
  func testReduce_06() {
    let r1 = Rational(numerator: 15, denominator: 15)
    let r2 = Rational(numerator: 1, denominator: 1, sign: .plus)
    assertRationalsEqual(r1.reduced(), r2)
  }
  
  func testReduce_07() {
    let r1 = Rational(numerator: 0, denominator: -15)
    let r2 = Rational(numerator: 0, denominator: 1, sign: .minus)
    assertRationalsEqual(r1.reduced(), r2)
  }
  
  func testReduce_08() {
    let r1 = Rational(numerator: 0, denominator: 15)
    let r2 = Rational(numerator: 0, denominator: 1, sign: .plus)
    assertRationalsEqual(r1.reduced(), r2)
  }
  
  func testReduce_09() {
    let r1 = Rational(numerator: -15, denominator: 0)
    let r2 = Rational(numerator: 1, denominator: 0, sign: .minus)
    assertRationalsEqual(r1.reduced(), r2)
  }
  
  func testReduce_10() {
    let r1 = Rational(numerator: 15, denominator: 0)
    let r2 = Rational(numerator: 1, denominator: 0, sign: .plus)
    assertRationalsEqual(r1.reduced(), r2)
  }
  
  func testMixedNumber_01() {
    let r = Rational(numerator: -15, denominator: 20)
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(0, r), m)
  }
  
  func testMixedNumber_02() {
    let r = Rational(numerator: -15, denominator: 15)
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(-1, Rational.zero), m)
  }
  
  func testMixedNumber_03() {
    let r = Rational(numerator: -15, denominator: 5)
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(-3, Rational.zero), m)
  }
  
  func testMixedNumber_04() {
    let r = Rational(numerator: -15, denominator: 4)
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(-3, Rational(numerator: 3, denominator: 4)), m)
  }
  
  func testMixedNumber_05() {
    let r = Rational(numerator: -15, denominator: 1)
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(-15, Rational.zero), m)
  }
  
  func testMixedNumber_06() {
    let r = Rational.zero
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(0, r), m)
  }
  
  func testMixedNumber_07() {
    let r = Rational(numerator: 1, denominator: 0)
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(0, r), m)
  }
  
  func testMixedNumber_08() {
    let r = Rational(numerator: 15, denominator: 1)
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(15, Rational.zero), m)
  }
  
  func testMixedNumber_09() {
    let r = Rational(numerator: 15, denominator: 4)
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(3, Rational(numerator: 3, denominator: 4)), m)
  }
  
  func testMixedNumber_10() {
    let r = Rational(numerator: 15, denominator: 5)
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(3, Rational.zero), m)
  }
  
  func testMixedNumber_11() {
    let r = Rational(numerator: 15, denominator: 15)
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(1, Rational.zero), m)
  }
  
  func testMixedNumber_12() {
    let r = Rational(numerator: 15, denominator: 20)
    let m = r.mixed()
    XCTAssertEqual(MixedNumber(0, r), m)
  }
  
  // MARK: Equatable protocol
  
  func testEqual_01() {
    let r1 = Rational(numerator: -12, denominator: 4)
    let r2 = Rational(numerator: -12, denominator: 4)
    XCTAssertTrue(r1 == r2)
  }
  
  func testEqual_02() {
    let r1 = Rational(numerator: -12, denominator: 4)
    let r2 = Rational(numerator: -24, denominator: 8)
    XCTAssertTrue(r1 == r2)
  }
  
  func testEqual_03() {
    let r1 = Rational(numerator: -12, denominator: 4)
    let r2 = Rational(numerator: 24, denominator: -8)
    XCTAssertTrue(r1 == r2)
  }
  
  func testEqual_04() {
    let r1 = Rational(numerator: -12, denominator: 4)
    let r2 = Rational(numerator: -6, denominator: 2)
    XCTAssertTrue(r1 == r2)
  }
  
  func testEqual_05() {
    let r1 = Rational(numerator: -12, denominator: 4)
    let r2 = Rational(numerator: 6, denominator: -2)
    XCTAssertTrue(r1 == r2)
  }
  
  func testEqual_06() {
    let r1 = Rational(numerator: -12, denominator: 12)
    let r2 = Rational(numerator: -1, denominator: 1)
    XCTAssertTrue(r1 == r2)
  }
  
  func testEqual_07() {
    let r1 = Rational(numerator: 0, denominator: 1)
    let r2 = Rational(numerator: 0, denominator: 1)
    XCTAssertTrue(r1 == r2)
  }
  
  func testEqual_08() {
    let r1 = Rational(numerator: 0, denominator: 1)
    let r2 = Rational(numerator: 0, denominator: -1)
    XCTAssertTrue(r1 == r2)
  }
  
  func testEqual_09() {
    let r1 = Rational(numerator: 12, denominator: 12)
    let r2 = Rational(numerator: 1, denominator: 1)
    XCTAssertTrue(r1 == r2)
  }
  
  func testEqual_10() {
    let r1 = Rational(numerator: 12, denominator: 4)
    let r2 = Rational(numerator: 6, denominator: 2)
    XCTAssertTrue(r1 == r2)
  }
  
  func testEqual_11() {
    let r1 = Rational(numerator: 12, denominator: 4)
    let r2 = Rational(numerator: 24, denominator: 8)
    XCTAssertTrue(r1 == r2)
  }
  
  func testEqual_12() {
    let r1 = Rational(numerator: 12, denominator: 4)
    let r2 = Rational(numerator: 12, denominator: 4)
    XCTAssertTrue(r1 == r2)
  }
  
  // MARK: Comparable protocol
  
  func testOrder_01() {
    let r1 = Rational(numerator: -1, denominator: 2)
    let r2 = Rational(numerator: -1, denominator: 3)
    assertOrder(r1, r2)
  }
  
  func testOrder_02() {
    let r1 = Rational(numerator: -1, denominator: 2)
    let r2 = Rational.zero
    assertOrder(r1, r2)
  }
  
  func testOrder_03() {
    let r1 = Rational(numerator: -1, denominator: 2)
    let r2 = Rational(numerator: 1, denominator: 2)
    assertOrder(r1, r2)
  }
  
  func testOrder_04() {
    let r1 = Rational(numerator: 0, denominator: 1)
    let r2 = Rational(numerator: 1, denominator: 2)
    assertOrder(r1, r2)
  }
  
  // MARK: Stridable protocol
  
  func testStride_01() {
    var endingValue = Rational.zero
    var numSteps = 0
    for i in stride(from: Rational(numerator: -10, denominator: 6), to: Rational(numerator: 9, denominator: 6), by: Rational(numerator: 1, denominator: 3)) {
      numSteps += 1
      endingValue = i
    }
    
    XCTAssertEqual(numSteps, 10)
    XCTAssertEqual(endingValue, Rational(numerator: 4, denominator: 3))
  }
  
  func testStride_02() {
    var endingValue = Rational.zero
    var numSteps = 0
    for i in stride(from: Rational(numerator: -10, denominator: 6), to: Rational(numerator: 10, denominator: 6), by: Rational(numerator: 1, denominator: 3)) {
      numSteps += 1
      endingValue = i
    }
    
    XCTAssertEqual(numSteps, 10)
    XCTAssertEqual(endingValue, Rational(numerator: 4, denominator: 3))
  }
  
  func testStride_03() {
    var endingValue = Rational.zero
    var numSteps = 0
    for i in stride(from: Rational(numerator: -10, denominator: 6), through: Rational(numerator: 10, denominator: 6), by: Rational(numerator: 1, denominator: 3)) {
      numSteps += 1
      endingValue = i
    }
    
    XCTAssertEqual(numSteps, 11)
    XCTAssertEqual(endingValue, Rational(numerator: 5, denominator: 3))
  }
  
  func testStride_04() {
    var endingValue = Rational.zero
    var numSteps = 0
    for i in stride(from: Rational(numerator: 10, denominator: 6), to: Rational(numerator: -9, denominator: 6), by: Rational(numerator: -1, denominator: 3)) {
      numSteps += 1
      endingValue = i
    }
    
    XCTAssertEqual(numSteps, 10)
    XCTAssertEqual(endingValue, Rational(numerator: -4, denominator: 3))
  }
  
  func testStride_05() {
    var endingValue = Rational.zero
    var numSteps = 0
    for i in stride(from: Rational(numerator: 10, denominator: 6), to: Rational(numerator: -10, denominator: 6), by: Rational(numerator: -1, denominator: 3)) {
      numSteps += 1
      endingValue = i
    }
    
    XCTAssertEqual(numSteps, 10)
    XCTAssertEqual(endingValue, Rational(numerator: -4, denominator: 3))
  }
  
  func testStride_06() {
    var endingValue = Rational.zero
    var numSteps = 0
    for i in stride(from: Rational(numerator: 10, denominator: 6), through: Rational(numerator: -10, denominator: 6), by: Rational(numerator: -1, denominator: 3)) {
      numSteps += 1
      endingValue = i
    }
    
    XCTAssertEqual(numSteps, 11)
    XCTAssertEqual(endingValue, Rational(numerator: -5, denominator: 3))
  }
  
  // MARK: ExpressibleByIntegerLiteral protocol
  
  func testIntegerLiteral_01() {
    let r: Rational = -1
    assertRationalsEqual(r, Rational(numerator: -1, denominator: 1))
  }
  
  func testIntegerLiteral_02() {
    let r: Rational = 0
    assertRationalsEqual(r, Rational(numerator: 0, denominator: 1))
  }
  
  func testIntegerLiteral_03() {
    let r: Rational = 1
    assertRationalsEqual(r, Rational(numerator: 1, denominator: 1))
  }
  
  // MARK: AdditiveArithmetic protocol
  
  func testZero() {
    let r = Rational.zero
    XCTAssertEqual(r.numerator, 0)
    XCTAssertEqual(r.denominator, 1)
    XCTAssertEqual(r.sign, .plus)
  }
  
  func testAddition_01() {
    let r1 = Rational.zero
    let r2 = Rational.zero
    let r3 = Rational.zero
    XCTAssertEqual(r1 + r2, r3)
  }
  
  func testAddition_02() {
    let r1 = Rational.zero
    let r2 = Rational(numerator: 1, denominator: 3)
    let r3 = Rational(numerator: 1, denominator: 3)
    XCTAssertEqual(r1 + r2, r3)
  }
  
  func testAddition_03() {
    let r1 = Rational.zero
    let r2 = Rational(numerator: -1, denominator: 3)
    let r3 = Rational(numerator: -1, denominator: 3)
    XCTAssertEqual(r1 + r2, r3)
  }
  
  func testAddition_04() {
    let r1 = Rational(numerator: 1, denominator: 2)
    let r2 = Rational(numerator: -1, denominator: 1)
    let r3 = Rational(numerator: -1, denominator: 2)
    XCTAssertEqual(r1 + r2, r3)
  }
  
  func testAddition_05() {
    let r1 = Rational(numerator: -1, denominator: 2)
    let r2 = Rational(numerator: 1, denominator: 1)
    let r3 = Rational(numerator: 1, denominator: 2)
    XCTAssertEqual(r1 + r2, r3)
  }
  
  func testAddition_06() {
    let r1 = Rational(numerator: 1, denominator: 1)
    let r2 = Rational(numerator: -1, denominator: 2)
    let r3 = Rational(numerator: 1, denominator: 2)
    XCTAssertEqual(r1 + r2, r3)
  }
  
  func testAddition_07() {
    let r1 = Rational(numerator: -1, denominator: 1)
    let r2 = Rational(numerator: 1, denominator: 2)
    let r3 = Rational(numerator: -1, denominator: 2)
    XCTAssertEqual(r1 + r2, r3)
  }
  
  // MARK: Numeric protocol
  
  func testMagnitude_01() {
    let r = Rational(numerator: 1, denominator: 2)
    XCTAssertEqual(r.magnitude, r)
  }
  
  func testMagnitude_02() {
    let r = Rational(numerator: -1, denominator: 2)
    XCTAssertEqual(r.magnitude, Rational(numerator: 1, denominator: 2))
  }
  
  func testMultiplication_01() {
    let r1 = Rational(numerator: 1, denominator: 2)
    let r2 = Rational(numerator: 2, denominator: 3)
    let r3 = Rational(numerator: 1, denominator: 3)
    XCTAssertEqual(r1 * r2, r3)
  }
  
  func testMultiplication_02() {
    let r1 = Rational(numerator: -1, denominator: 6)
    let r2 = Rational(numerator: 2, denominator: 1)
    let r3 = Rational(numerator: -1, denominator: 3)
    XCTAssertEqual(r1 * r2, r3)
  }
  
  // MARK: SignedNumeric protocol
  
  func testNegation_01() {
    var r = Rational.zero
    r.negate()
    XCTAssertEqual(r.sign, .plus)
  }
  
  func testNegation_02() {
    var r = Rational(numerator: 1, denominator: 2)
    r.negate()
    XCTAssertEqual(r.sign, .minus)
  }
  
  func testNegation_03() {
    var r = Rational(numerator: -1, denominator: 2)
    r.negate()
    XCTAssertEqual(r.sign, .plus)
  }
  
  // MARK: Public functions
  
  func testDivision_01() {
    let r1 = Rational(numerator: 1, denominator: 2)
    let r2 = Rational(numerator: 1, denominator: 2)
    let r3 = Rational(numerator: 1, denominator: 1)
    XCTAssertEqual(r1 / r2, r3)
  }
  
  func testDivision_02() {
    let r1 = Rational(numerator: 1, denominator: 2)
    let r2 = Rational(numerator: -1, denominator: 2)
    let r3 = Rational(numerator: -1, denominator: 1)
    XCTAssertEqual(r1 / r2, r3)
  }
  
  func testDivision_03() {
    let r1 = Rational(numerator: 1, denominator: 2)
    let r2 = Rational(numerator: 2, denominator: 1)
    let r3 = Rational(numerator: 1, denominator: 4)
    XCTAssertEqual(r1 / r2, r3)
  }
  
  func testDivision_04() {
    let r1 = Rational(numerator: 1, denominator: 2)
    let r2 = Rational(numerator: -2, denominator: 1)
    let r3 = Rational(numerator: -1, denominator: 4)
    XCTAssertEqual(r1 / r2, r3)
  }
  
  static var allTests = [
    ("testMaxValue", testMaxValue),
    ("testMinValue", testMinValue),
    ("testLeastNonzeroMagnitudeValue", testLeastNonzeroMagnitudeValue),
    ("testNaNValue", testNaNValue),
    ("testDoubleValue_01", testDoubleValue_01),
    ("testDoubleValue_02", testDoubleValue_02),
    ("testDoubleValue_03", testDoubleValue_03),
    ("testDoubleValue_04", testDoubleValue_04),
    ("testFloatValue_01", testFloatValue_01),
    ("testFloatValue_02", testFloatValue_02),
    ("testFloatValue_03", testFloatValue_03),
    ("testFloatValue_04", testFloatValue_04),
    ("testIsNaNValue", testIsNaNValue),
    ("testIsNotNaNValue", testIsNotNaNValue),
    ("testIsUndefinedValue", testIsUndefinedValue),
    ("testIsNotUndefinedValue", testIsNotUndefinedValue),
    ("testIsZero_01", testIsZero_01),
    ("testIsZero_02", testIsZero_02),
    ("testIsNotZero_01", testIsNotZero_01),
    ("testIsNotZero_02", testIsNotZero_02),
    ("testIsProper_01", testIsProper_01),
    ("testIsProper_02", testIsProper_02),
    ("testIsProper_03", testIsProper_03),
    ("testIsNotProper_01", testIsNotProper_01),
    ("testIsNotProper_02", testIsNotProper_02),
    ("testIsNotProper_03", testIsNotProper_03),
    ("testIsNotProper_04", testIsNotProper_04),
    ("testInitWithIntegerLiteralType_01", testInitWithIntegerLiteralType_01),
    ("testInitWithIntegerLiteralType_02", testInitWithIntegerLiteralType_02),
    ("testInitWithIntegerLiteralType_03", testInitWithIntegerLiteralType_03),
    ("testInitWithIntegerLiteralType_04", testInitWithIntegerLiteralType_04),
    ("testReduce_01", testReduce_01),
    ("testReduce_02", testReduce_02),
    ("testReduce_03", testReduce_03),
    ("testReduce_04", testReduce_04),
    ("testReduce_05", testReduce_05),
    ("testReduce_06", testReduce_06),
    ("testReduce_07", testReduce_07),
    ("testReduce_08", testReduce_08),
    ("testReduce_09", testReduce_09),
    ("testReduce_10", testReduce_10),
    ("testMixedNumber_01", testMixedNumber_01),
    ("testMixedNumber_02", testMixedNumber_02),
    ("testMixedNumber_03", testMixedNumber_03),
    ("testMixedNumber_04", testMixedNumber_04),
    ("testMixedNumber_05", testMixedNumber_05),
    ("testMixedNumber_06", testMixedNumber_06),
    ("testMixedNumber_07", testMixedNumber_07),
    ("testMixedNumber_08", testMixedNumber_08),
    ("testMixedNumber_09", testMixedNumber_09),
    ("testMixedNumber_10", testMixedNumber_10),
    ("testMixedNumber_11", testMixedNumber_11),
    ("testMixedNumber_12", testMixedNumber_12),
    ("testEqual_01", testEqual_01),
    ("testEqual_02", testEqual_02),
    ("testEqual_03", testEqual_03),
    ("testEqual_04", testEqual_04),
    ("testEqual_05", testEqual_05),
    ("testEqual_06", testEqual_06),
    ("testEqual_07", testEqual_07),
    ("testEqual_08", testEqual_08),
    ("testEqual_09", testEqual_09),
    ("testEqual_10", testEqual_10),
    ("testEqual_11", testEqual_11),
    ("testEqual_12", testEqual_12),
    ("testOrder_01", testOrder_01),
    ("testOrder_02", testOrder_02),
    ("testOrder_03", testOrder_03),
    ("testOrder_04", testOrder_04),
    ("testStride_01", testStride_01),
    ("testStride_02", testStride_02),
    ("testStride_03", testStride_03),
    ("testStride_04", testStride_04),
    ("testStride_05", testStride_05),
    ("testStride_06", testStride_06),
    ("testIntegerLiteral_01", testIntegerLiteral_01),
    ("testIntegerLiteral_02", testIntegerLiteral_02),
    ("testIntegerLiteral_03", testIntegerLiteral_03),
    ("testZero", testZero),
    ("testAddition_01", testAddition_01),
    ("testAddition_02", testAddition_02),
    ("testAddition_03", testAddition_03),
    ("testAddition_04", testAddition_04),
    ("testAddition_05", testAddition_05),
    ("testAddition_06", testAddition_06),
    ("testAddition_07", testAddition_07),
    ("testMagnitude_01", testMagnitude_01),
    ("testMagnitude_02", testMagnitude_02),
    ("testMultiplication_01", testMultiplication_01),
    ("testMultiplication_02", testMultiplication_02),
    ("testNegation_01", testNegation_01),
    ("testNegation_02", testNegation_02),
    ("testNegation_03", testNegation_03),
    ("testDivision_01", testDivision_01),
    ("testDivision_02", testDivision_02),
    ("testDivision_03", testDivision_03),
  ]
  
}

// MARK: Private methods

extension RationalNumberTests {
  
  /// Asserts that two rational numbers are equal by comparing their numerators, denominators and sign.
  ///
  /// - Parameters:
  ///   - r1: The first rational number to compare.
  ///   - r2: The second rational number to compare.
  ///   - file: The file this method was called from.
  ///   - line: The line number this method was called from.
  private func assertRationalsEqual(_ r1: Rational, _ r2: Rational, file: StaticString = #file, line: UInt = #line) {
    XCTAssertEqual(r1.numerator, r2.numerator, file: file, line: line)
    XCTAssertEqual(r1.denominator, r2.denominator, file: file, line: line)
    XCTAssertEqual(r1.sign, r2.sign, file: file, line: line)
  }
  
  /// Asserts the order of two rationals by checking the less than operator and then greater than or equal to.
  ///
  /// - Parameters:
  ///   - r1: The first rational number to compare.
  ///   - r2: The second rational number to compare.
  ///   - file: The file this method was called from.
  ///   - line: The line number this method was called from.
  private func assertOrder(_ r1: Rational, _ r2: Rational, file: StaticString = #file, line: UInt = #line) {
    XCTAssertTrue(r1 < r2, file: file, line: line)
    XCTAssertFalse(r1 >= r2, file: file, line: line)
  }
  
}
