//
// MixedNumberTests.swift
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

final class MixedNumberTests: XCTestCase {
  
  // MARK: MixedNumber
  
  func testToRational_01() {
    let m = MixedNumber<Rational>(0, Rational(numerator: 1, denominator: 2))
    let r = m.toRational()
    XCTAssertEqual(r, Rational(numerator: 1, denominator: 2))
  }
  
  func testToRational_02() {
    let m = MixedNumber<Rational>(1, Rational(numerator: 1, denominator: 2))
    let r = m.toRational()
    XCTAssertEqual(r, Rational(numerator: 3, denominator: 2))
  }
  
  func testToRational_03() {
    let m = MixedNumber<Rational>(-1, Rational(numerator: 1, denominator: 2))
    let r = m.toRational()
    XCTAssertEqual(r, Rational(numerator: -3, denominator: 2))
  }
  
  // MARK: Equatable protocol
  
  func testEqual_01() {
    let m1 = MixedNumber<Rational>(1, Rational(numerator: 1, denominator: 2))
    let m2 = MixedNumber<Rational>(1, Rational(numerator: 1, denominator: 2))
    XCTAssertEqual(m1, m2)
  }
  
  func testEqual_02() {
    let m1 = MixedNumber<Rational>(1, Rational(numerator: 1, denominator: 2))
    let m2 = MixedNumber<Rational>(1, Rational(numerator: 2, denominator: 4))
    XCTAssertEqual(m1, m2)
  }
  
  func testNotEqual_01() {
    let m1 = MixedNumber<Rational>(1, Rational(numerator: 1, denominator: 2))
    let m2 = MixedNumber<Rational>(-1, Rational(numerator: 1, denominator: 2))
    XCTAssertNotEqual(m1, m2)
  }
  
  func testNotEqual_02() {
    let m1 = MixedNumber<Rational>(1, Rational(numerator: 1, denominator: 2))
    let m2 = MixedNumber<Rational>(1, Rational(numerator: -1, denominator: 2))
    XCTAssertNotEqual(m1, m2)
  }
  
  static var allTests = [
    ("testToRational_01", testToRational_01),
    ("testToRational_02", testToRational_02),
    ("testToRational_03", testToRational_03),
    ("testEqual_01", testEqual_01),
    ("testEqual_02", testEqual_02),
    ("testNotEqual_01", testNotEqual_01),
    ("testNotEqual_02", testNotEqual_02),
  ]
  
}
