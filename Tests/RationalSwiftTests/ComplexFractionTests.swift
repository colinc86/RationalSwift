//
// ComplexFractionTests.swift
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

final class ComplexFractionTests: XCTestCase {
  
  func testAddition() {
    let r1 = Rational(numerator: 1, denominator: 2)
    let r2 = Rational(numerator: 1, denominator: 2)
    let c = ComplexFraction<Rational>(numerator: r1, denominator: r2)
    XCTAssertEqual(c + c, 2.0)
  }
  
  func testSubtraction() {
    let r1 = Rational(numerator: 1, denominator: 2)
    let r2 = Rational(numerator: 1, denominator: 2)
    let c = ComplexFraction<Rational>(numerator: r1, denominator: r2)
    XCTAssertEqual(c - c, 0.0)
  }
  
  func testMultiplication() {
    let r1 = Rational(numerator: 1, denominator: 2)
    let r2 = Rational(numerator: 1, denominator: 2)
    let c = ComplexFraction<Rational>(numerator: r1, denominator: r2)
    XCTAssertEqual(c * c, 1.0)
  }
  
  func testDivision() {
    let r1 = Rational(numerator: 1, denominator: 2)
    let r2 = Rational(numerator: 1, denominator: 2)
    let c = ComplexFraction<Rational>(numerator: r1, denominator: r2)
    XCTAssertEqual(c / c, 1.0)
  }
  
  static var allTests = [
    ("testAddition", testAddition),
    ("testSubtraction", testSubtraction),
    ("testMultiplication", testMultiplication),
    ("testDivision", testDivision),
  ]
  
}
