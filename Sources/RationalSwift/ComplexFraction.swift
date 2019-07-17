//
// ComplexFraction.swift
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

/// Complex fractions are fractions whose numerator and denominator both inherit
/// from the `Fractional` protocol.
public struct ComplexFraction<T: Fractional>: Fractional {
  
  /// The numerator and denominator's type.
  public typealias FractionalElement = T
  
  /// The complex fraction's numerator.
  public var numerator: FractionalElement
  
  /// The complex fraction's denominator.
  public var denominator: FractionalElement
  
  public init(numerator: FractionalElement, denominator: FractionalElement) {
    self.numerator = numerator
    self.denominator = denominator
  }
  
  public var doubleValue: Double {
    return numerator.doubleValue / denominator.doubleValue
  }
  
  public var floatValue: Float {
    return numerator.floatValue / denominator.floatValue
  }
  
}

// MARK: Public methods

public func + <T: RationalNumber>(lhs: ComplexFraction<T>, rhs: ComplexFraction<T>) -> Double {
  return lhs.doubleValue + rhs.doubleValue
}

public func - <T: RationalNumber>(lhs: ComplexFraction<T>, rhs: ComplexFraction<T>) -> Double {
  return lhs.doubleValue - rhs.doubleValue
}

public func * <T: RationalNumber>(lhs: ComplexFraction<T>, rhs: ComplexFraction<T>) -> Double {
  return lhs.doubleValue * rhs.doubleValue
}

public func / <T: RationalNumber>(lhs: ComplexFraction<T>, rhs: ComplexFraction<T>) -> Double {
  return lhs.doubleValue / rhs.doubleValue
}

public func ^ <T: RationalNumber>(lhs: ComplexFraction<T>, rhs: ComplexFraction<T>) -> Double {
  return pow(lhs.doubleValue, rhs.doubleValue)
}
