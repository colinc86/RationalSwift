//
// Rational.swift
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

import Foundation

/// A signed rational number value type.
public struct Rational: Codable, RationalNumber {
  
  public typealias RationalStorageType = UInt
  
  public typealias IntegerLiteralType = Int
  
  public var sign: RationalNumberSign
  
  public var numerator: RationalStorageType
  
  public var denominator: RationalStorageType
  
  public init(numerator: UInt, denominator: UInt, sign: RationalNumberSign = .plus) {
    self.numerator = numerator
    self.denominator = denominator
    self.sign = sign
  }
  
  public static var pi: Rational {
    let pi64 = Rational64.pi
    var n = UInt(pi64.numerator)
    var d = UInt(pi64.denominator)
    
    if Int.bitWidth == Int64.bitWidth {
      let p128 = Rational128.pi
      n = UInt(p128.numerator)
      d = UInt(p128.denominator)
    }
    
    return Rational(numerator: n, denominator: d)
  }
  
}

/// A 16-bit signed rational number value type.
public struct Rational16: Codable, RationalNumber {
  
  public typealias FractionalElement = UInt8
  
  public typealias RationalStorageType = UInt8
  
  public typealias IntegerLiteralType = Int8
  
  public var sign: RationalNumberSign
  
  public var numerator: RationalStorageType
  
  public var denominator: RationalStorageType
  
  public init(numerator: UInt8, denominator: UInt8, sign: RationalNumberSign = .plus) {
    self.numerator = numerator
    self.denominator = denominator
    self.sign = sign
  }
  
  public static var pi: Rational16 {
    return Rational16(numerator: 245, denominator: 78)
  }
  
}

/// A 32-bit signed rational number value type.
public struct Rational32: Codable, RationalNumber {
  
  public typealias FractionalElement = UInt16
  
  public typealias RationalStorageType = UInt16
  
  public typealias IntegerLiteralType = Int16
  
  public var sign: RationalNumberSign
  
  public var numerator: RationalStorageType
  
  public var denominator: RationalStorageType
  
  public init(numerator: UInt16, denominator: UInt16, sign: RationalNumberSign = .plus) {
    self.numerator = numerator
    self.denominator = denominator
    self.sign = sign
  }
  
  public static var pi: Rational32 {
    return Rational32(numerator: 65298, denominator: 20785)
  }
  
}

/// A 64-bit signed rational number value type.
public struct Rational64: Codable, RationalNumber {
  
  public typealias FractionalElement = UInt32
  
  public typealias RationalStorageType = UInt32
  
  public typealias IntegerLiteralType = Int32
  
  public var sign: RationalNumberSign
  
  public var numerator: RationalStorageType
  
  public var denominator: RationalStorageType
  
  public init(numerator: UInt32, denominator: UInt32, sign: RationalNumberSign = .plus) {
    self.numerator = numerator
    self.denominator = denominator
    self.sign = sign
  }
  
  public static var pi: Rational64 {
    return Rational64(numerator: 3618458675, denominator: 1151791169)
  }
  
}

/// A 128-bit signed rational number value type.
public struct Rational128: Codable, RationalNumber {
  
  public typealias FractionalElement = UInt64
  
  public typealias RationalStorageType = UInt64
  
  public typealias IntegerLiteralType = Int64
  
  public var sign: RationalNumberSign
  
  public var numerator: RationalStorageType
  
  public var denominator: RationalStorageType
  
  public init(numerator: UInt64, denominator: UInt64, sign: RationalNumberSign = .plus) {
    self.numerator = numerator
    self.denominator = denominator
    self.sign = sign
  }
  
  public static var pi: Rational128 {
    return Rational128(numerator: 2646693125139304345, denominator: 842468587426513207)
  }
  
}
