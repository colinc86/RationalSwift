//
// MixedNumber.swift
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

/// A type whose properties represent the integer and fractional parts of a mixed number.
public struct MixedNumber<T: RationalNumber>: Equatable {
  
  /// The integer part of the mixed number.
  public var integerPart: T.IntegerLiteralType
  
  /// The fractional part of the mixed number.
  public var fractionalPart: T
  
  // MARK: Initializers
  
  /// Initializes a mixed number with an integer and fractionl part.
  ///
  /// - Parameters:
  ///   - integerPart: The integer part of the mixed number.
  ///   - fractionalPart: The fractional part of the mixed number.
  public init(_ integerPart: T.IntegerLiteralType, _ fractionalPart: T) {
    self.integerPart = integerPart
    self.fractionalPart = fractionalPart
  }
  
}

// MARK: Public methods

extension MixedNumber {
  
  /// Converts the mixed number to a rational number. The sign on the fractional part of the mixed number is ignored as the
  /// integer part's sign preceeds it.
  ///
  /// - Returns: A rational number.
  public func toRational() -> T {
    return T(numerator: T.RationalStorageType(abs(integerPart)) * fractionalPart.denominator + fractionalPart.numerator, denominator: fractionalPart.denominator, sign: integerPart >= 0 ? .plus : .minus)
  }
  
}

// MARK: Equatable protocol

extension MixedNumber {
  
  public static func == (lhs: MixedNumber<T>, rhs: MixedNumber<T>) -> Bool {
    return lhs.integerPart == rhs.integerPart && lhs.fractionalPart == rhs.fractionalPart
  }
  
}
