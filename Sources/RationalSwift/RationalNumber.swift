//
// RationalNumber.swift
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

/// A fractional type represented by a numerator and denominator.
public protocol RationalNumber: CustomStringConvertible, Fractional, Hashable, SignedNumeric, Strideable where IntegerLiteralType: SignedInteger {
  
  /// A rational number's storage type.
  associatedtype RationalStorageType: FixedWidthInteger, UnsignedInteger
    
  /// The magnitude of a rational number.
  associatedtype Magnitude = Self
  
  /// The maximum representable rational number in this type.
  static var max: Self { get }
  
  /// The minimum representable rational number in this type.
  static var min: Self { get }
  
  /// The least positive number.
  static var leastNonzeroMagnitude: Self { get }
  
  /// Rational numbers define a single `nan` value, but any rational of the form `x/0`
  /// should return `true` for `isNaN`.
  static var nan: Self { get }
  
  /// An undefined value. Typically 0/0.
  static var undefined: Self { get }
  
  /// An approximation of Pi in this type.
  static var pi: Self { get }
  
  /// The numerator of the rational number.
  var numerator: RationalStorageType { get set }
  
  /// The denominator of the rational number.
  var denominator: RationalStorageType { get set }
  
  /// The sign of the rational number.
  var sign: RationalNumberSign { get set }
  
  /// A boolean value indicating whether or not the receiver cannot be represented as a number.
  var isNaN: Bool { get }
  
  /// A boolean value indicating whether or not the receiver's numerator and denominator are both zero.
  var isUndefined: Bool { get }
  
  /// A boolean value indicating whether or not the receiver evaluates to zero.
  var isZero: Bool { get }
  
  /// A boolean value indicating whether or not the receiver is greater than -1 and less than 1.
  var isProper: Bool { get }
  
  /// Initializes a rational number with the given numerator, denominator and sign.
  ///
  /// - Parameters:
  ///   - numerator: The numerator of the rational number.
  ///   - denominator: The denominator of the rational number.
  ///   - sign: The sign of the rational number.
  init(numerator: RationalStorageType, denominator: RationalStorageType, sign: RationalNumberSign)
  
  /// Initializes a rational number with the given numerator and denominator.
  ///
  /// - Parameters:
  ///   - numerator: The numerator of the rational number.
  ///   - denominator: The denominator of the rational number.
  init(numerator: IntegerLiteralType, denominator: IntegerLiteralType)
  
  /// Reduces the receiver.
  mutating func reduce()
  
  /// Reduces the receiver.
  ///
  /// - Returns: A reduced copy of the receiver.
  func reduced() -> Self
  
  /// Returns a reduced version of the receiver in mixed number form.
  ///
  /// - Returns: An integer and fractional part.
  func mixed() -> MixedNumber<Self>
  
  /// Makes the receiver the inverse of itself.
  mutating func makeInverse()
  
  /// Returns the multiplicative inverse of the receiver.
  ///
  /// - Returns: A fraction of the form b/a where a/b is the receiver.
  func inverse() -> Self
  
}

// MARK: RationalNumber implementation

extension RationalNumber {
  
  public static var max: Self {
    return Self.init(numerator: RationalStorageType.max, denominator: 1, sign: .plus)
  }
  
  public static var min: Self {
    return Self.init(numerator: RationalStorageType.max, denominator: 1, sign: .minus)
  }
  
  public static var leastNonzeroMagnitude: Self {
    return Self.init(numerator: 1, denominator: RationalStorageType.max, sign: .plus)
  }
  
  public static var nan: Self {
    return Self.init(numerator: 1, denominator: RationalStorageType.zero, sign: .plus)
  }
  
  public static var undefined: Self {
    return Self.init(numerator: RationalStorageType.zero, denominator: RationalStorageType.zero, sign: .plus)
  }
  
  public var doubleValue: Double {
    return Double(numerator) / Double(denominator) * (sign == .minus ? -1.0 : 1.0)
  }
  
  public var floatValue: Float {
    return Float(numerator) / Float(denominator) * (sign == .minus ? -1.0 : 1.0)
  }
  
  public var isNaN: Bool {
    return numerator != RationalStorageType.zero && denominator == RationalStorageType.zero
  }
  
  public var isUndefined: Bool {
    return numerator == RationalStorageType.zero && denominator == RationalStorageType.zero
  }
  
  public var isZero: Bool {
    return numerator == 0 && denominator != 0
  }
  
  public var isProper: Bool {
    return numerator < denominator
  }
  
  public init(numerator: IntegerLiteralType, denominator: IntegerLiteralType) {
    self.init(numerator: RationalStorageType(absi(numerator)), denominator: RationalStorageType(absi(denominator)), sign: RationalNumberSign.from(numerator, denominator))
  }
  
  public mutating func reduce() {
    if numerator == .zero && denominator != .zero {
      denominator = 1
    }
    else if numerator != .zero && denominator == .zero {
      numerator = 1
    }
    else if numerator != .zero && denominator != .zero {
      let factor = gcd(numerator, denominator)
      numerator /= factor
      denominator /= factor
    }
  }
  
  public func reduced() -> Self {
    var c = self
    c.reduce()
    return c
  }
  
  public func mixed() -> MixedNumber<Self> {
    guard denominator != 0 && numerator >= denominator else {
      return MixedNumber(0, self)
    }
    
    let w = numerator / denominator
    let n = numerator - (w * denominator)
    return MixedNumber((sign == .minus ? -1 : 1) * IntegerLiteralType(w), Self.init(numerator: n, denominator: denominator, sign: .plus))
  }
  
  public mutating func makeInverse() {
    let tempNumerator = numerator
    numerator = denominator
    denominator = tempNumerator
  }
  
  public func inverse() -> Self {
    return Self.init(numerator: denominator, denominator: numerator, sign: sign)
  }
  
}

// MARK: CustomStringConvertible protocol

extension RationalNumber {
  
  public var description: String {
    return String(format: "%@%d/%d", sign == .minus ? "-" : "", UInt(numerator), UInt(denominator))
  }
  
}

// MARK: Equatable protocol

extension RationalNumber {
  
  public static func == (lhs: Self, rhs: Self) -> Bool {
    guard !lhs.isUndefined && !rhs.isUndefined else {
      return false
    }
    
    if lhs.isZero && rhs.isZero {
      return true
    }
    
    guard lhs.numerator > RationalStorageType.zero && rhs.numerator > RationalStorageType.zero else {
      return false
    }
    
    if rhs.numerator >= lhs.numerator {
      let multiple = Double(rhs.numerator) / Double(lhs.numerator)
      return multiple - Double(Int(multiple)) == 0.0 && Double(lhs.denominator) == Double(rhs.denominator) / multiple && lhs.sign == rhs.sign
    }
    else {
      let multiple = Double(lhs.numerator) / Double(rhs.numerator)
      return multiple - Double(Int(multiple)) == 0.0 && Double(rhs.denominator) == Double(lhs.denominator) / multiple && lhs.sign == rhs.sign
    }
  }
  
}

// MARK: Comparable protocol

extension RationalNumber {
  
  public static func < (lhs: Self, rhs: Self) -> Bool {
    return lhs.doubleValue < rhs.doubleValue
  }
  
}

// MARK: Stridable protocol

extension RationalNumber {
  
  public func advanced(by n: Self) -> Self {
    return self + n
  }
  
  public func distance(to other: Self) -> Self {
    return absr(self - other)
  }
  
}

// MARK: ExpressibleByIntegerLiteral protocol

extension RationalNumber {
  
  public init(integerLiteral value: IntegerLiteralType) {
    self.init(numerator: value, denominator: 1)
  }
  
}

// MARK: AdditiveArithmetic protocol

extension RationalNumber {
  
  public static var zero: Self {
    return Self.init(numerator: 0, denominator: 1)
  }
  
  public static func + (lhs: Self, rhs: Self) -> Self {
    guard !lhs.isUndefined && !rhs.isUndefined else {
      return Self.undefined
    }
    
    guard !lhs.isNaN && !rhs.isNaN else {
      return Self.nan
    }
    
    var lNumerator = lhs.numerator
    var rNumerator = rhs.numerator
    var m = lhs.denominator
    
    if lhs.denominator != rhs.denominator {
      m = lcm(lhs.denominator, rhs.denominator)
      lNumerator = lhs.numerator * m / lhs.denominator
      rNumerator = rhs.numerator * m / rhs.denominator
    }
    
    if lhs.sign == rhs.sign {
      return Self.init(numerator: lNumerator + rNumerator, denominator: m, sign: lhs.sign)
    }
    
    let diff = lNumerator > rNumerator ? lNumerator - rNumerator : rNumerator - lNumerator
    if (lhs.sign == .plus && lhs > absr(rhs)) || (rhs.sign == .plus && rhs > absr(lhs)) {
      return Self.init(numerator: diff, denominator: m, sign: .plus)
    }
    
    return Self.init(numerator: diff, denominator: m, sign: diff == 0 ? .plus : .minus)
  }
  
  public static func += (lhs: inout Self, rhs: Self) {
    lhs = lhs + rhs
  }
  
  public static func - (lhs: Self, rhs: Self) -> Self {
    var rhsc = rhs
    rhsc.negate()
    return lhs + rhsc
  }
  
  public static func -= (lhs: inout Self, rhs: Self) {
    lhs = lhs - rhs
  }
  
}

// MARK: Numeric protocol

extension RationalNumber {
  
  public init?<T>(exactly source: T) where T : BinaryInteger {
    self.init(numerator: IntegerLiteralType(source), denominator: 1)
  }
  
  public var magnitude: Self.Magnitude {
    return absr(self) as! Self.Magnitude
  }
  
  public static func * (lhs: Self, rhs: Self) -> Self {
    return Self.init(numerator: lhs.numerator * rhs.numerator, denominator: lhs.denominator * rhs.denominator, sign: lhs.sign.combined(with: rhs.sign))
  }
  
  public static func *= (lhs: inout Self, rhs: Self) {
    lhs.numerator *= rhs.numerator
    lhs.denominator *= rhs.denominator
    lhs.sign.combine(with: rhs.sign)
  }
  
}

// MARK: SignedNumeric protocol

extension RationalNumber {
  
  public mutating func negate() {
    if !isZero && !isUndefined {
      sign.flip()
    }
  }
  
  public static prefix func - (rhs: Self) -> Self {
    var c = rhs
    c.negate()
    return c
  }
  
}

// MARK: Private functions

/// Returns the absolute value of the given number.
internal func absi<T: SignedInteger>(_ n: T) -> T {
  if n < T.zero {
    var m = n
    m.negate()
    return m
  }
  return n
}

/// Finds the least common multiple (LCM) between two positive integers.
///
/// - Parameters:
///   - m: An integer.
///   - n: An integer.
/// - Returns: The LCM between `m` and `n`.
private func lcm<T: UnsignedInteger>(_ m: T, _ n: T) -> T {
  return m * n / gcd(m, n)
}

/// Finds the greatest common divisor (GCD) between two positive integers.
///
/// - Parameters:
///   - m: A positive integer.
///   - n: A positive integer.
/// - Returns: The GDC between `m` and `n`.
private func gcd<T: UnsignedInteger>(_ m: T, _ n: T) -> T {
  var a: T = 0
  var b: T = max(m, n)
  var r: T = min(m, n)
  
  while r != 0 {
    a = b
    b = r
    r = a % b
  }
  
  return b
}

// MARK: Public functions

/// Returns the absolute value of the given rational number.
public func absr<T: RationalNumber>(_ n: T) -> T {
  return T.init(numerator: n.numerator, denominator: n.denominator, sign: .plus)
}

/// Divides the left hand side of the operator by the right hand side.
public func / <T: RationalNumber>(lhs: T, rhs: T) -> T {
  let numerator = lhs.numerator * rhs.denominator
  let denominator = lhs.denominator * rhs.numerator
  return T.init(numerator: numerator, denominator: denominator, sign: lhs.sign.combined(with: rhs.sign))
}

/// Divides the left hand side of the operator by the right hand side and leaves the results in the left hand side.
public func /= <T: RationalNumber>(lhs: inout T, rhs: T) {
  lhs = lhs / rhs
}

/// Returns an integer raised to a positive integer power.
public func powr<T: FixedWidthInteger & UnsignedInteger>(_ base: T, _ exponent: UInt) -> T {
  guard exponent > 0 else {
    return 1
  }
  
  var n = base
  for _ in 0 ..< exponent - 1 {
    n *= base
  }
  return n
}

/// Raises the left hand side of the operator to the power of the right hand side.
public func ^ <T: RationalNumber>(lhs: T, rhs: Int) -> T {
  let urhs = UInt(abs(rhs))
  
  if rhs >= 0 {
    let numerator = powr(lhs.numerator, urhs)
    let denominator = powr(lhs.denominator, urhs)
    return rhs % 2 == 0 ? T.init(numerator: numerator, denominator: denominator, sign: .plus) : T.init(numerator: numerator, denominator: denominator, sign: lhs.sign)
  }
  else {
    let numerator = powr(lhs.denominator, urhs)
    let denominator = powr(lhs.numerator, urhs)
    return rhs % 2 == 0 ? T.init(numerator: numerator, denominator: denominator, sign: .plus) : T.init(numerator: numerator, denominator: denominator, sign: lhs.sign)
  }
}

/// Raises the left hand side of the operator to the power of the right hand side.
public func ^= <T: RationalNumber>(lhs: inout T, rhs: Int) {
  lhs = lhs ^ rhs
}
