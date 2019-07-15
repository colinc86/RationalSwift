//
// RationalNumberSignTests.swift
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

final class RationalNumberSignTests: XCTestCase {
  
  func testFlip_01() {
    var s = RationalNumberSign.plus
    s.flip()
    XCTAssertEqual(s, .minus)
  }
  
  func testFlip_02() {
    var s = RationalNumberSign.minus
    s.flip()
    XCTAssertEqual(s, .plus)
  }
  
  func testCombine_01() {
    var s = RationalNumberSign.plus
    s.combine(with: .plus)
    XCTAssertEqual(s, .plus)
  }
  
  func testCombine_02() {
    var s = RationalNumberSign.plus
    s.combine(with: .minus)
    XCTAssertEqual(s, .minus)
  }
  
  func testCombine_03() {
    var s = RationalNumberSign.minus
    s.combine(with: .plus)
    XCTAssertEqual(s, .minus)
  }
  
  func testCombine_04() {
    var s = RationalNumberSign.minus
    s.combine(with: .minus)
    XCTAssertEqual(s, .plus)
  }
  
  func testFrom_01() {
    let s = RationalNumberSign.from(0)
    XCTAssertEqual(s, .plus)
  }
  
  func testFrom_02() {
    let s = RationalNumberSign.from(0, 1)
    XCTAssertEqual(s, .plus)
  }
  
  func testFrom_03() {
    let s = RationalNumberSign.from(0, 1, -1)
    XCTAssertEqual(s, .minus)
  }
  
  func testFrom_04() {
    let s = RationalNumberSign.from(0, 1, -1, 1)
    XCTAssertEqual(s, .minus)
  }
  
  func testFrom_05() {
    let s = RationalNumberSign.from(0, 1, -1, 1, -1)
    XCTAssertEqual(s, .plus)
  }
  
  static var allTests = [
    ("testFlip_01", testFlip_01),
    ("testFlip_02", testFlip_02),
    ("testCombine_01", testCombine_01),
    ("testCombine_02", testCombine_02),
    ("testCombine_03", testCombine_03),
    ("testCombine_04", testCombine_04),
    ("testFrom_01", testFrom_01),
    ("testFrom_02", testFrom_02),
    ("testFrom_03", testFrom_03),
    ("testFrom_04", testFrom_04),
    ("testFrom_05", testFrom_05),
  ]
  
}
