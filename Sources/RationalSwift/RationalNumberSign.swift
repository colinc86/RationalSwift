//
// RationalNumberSign.swift
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

/// The sign of a rational number.
public enum RationalNumberSign: String, Codable {
  
  /// The sign for a negative value.
  case minus
  
  /// The sign for a positive value.
  case plus
  
  /// Flips the sign from `plus` to `minus` or `minus` to `plus`.
  public mutating func flip() {
    self = flipped()
  }
  
  /// Provides a flipped version of the receiver.
  ///
  /// - Returns: `minus` if the receiver is `plus`, and `plus` if the receiver is `minus`.
  public func flipped() -> RationalNumberSign {
    switch self {
    case .minus:
      return .plus
    case .plus:
      return .minus
    }
  }
  
  /// Combines the receiver with another sign by way of binary multiplication of unit
  /// values whoes signs are are the receiver and `sign`.
  ///
  /// - Parameter sign: The sign to combine the receiver with.
  public mutating func combine(with sign: RationalNumberSign) {
    self = combined(with: sign)
  }
  
  /// Provides the sign created by combining the receiver and `sign`.
  ///
  /// - Parameter sign: The sign to combine with the receiver.
  /// - Returns: `plus` if the signs are the same and `minus` otherwise.
  public func combined(with sign: RationalNumberSign) -> RationalNumberSign {
    return self == sign ? .plus : .minus
  }
  
  /// Creates a sign from an array of numbers.
  ///
  /// - Parameter numbers: An array of signed numbers.
  /// - Returns: A sign.
  public static func from<T: SignedNumeric & Comparable>(_ numbers: T...) -> RationalNumberSign {
    return numbers.filter({ $0 < T.zero }).count % 2 == 0 ? .plus : .minus
  }
  
}
