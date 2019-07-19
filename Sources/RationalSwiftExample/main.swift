import Foundation
import RationalSwift

// Basic arithmetic
let r1 = Rational(numerator: 2, denominator: 3)
let r2 = Rational(numerator: 3, denominator: 5)

let a = r1 + r2
print(a)

let b = r1 - r2
print(b)

let c = r1 * r2
print(c)

let d = r1 / r2
print(d)

// Find a rational approximation of Zeta(3)
var r: Rational = 1
for i in 2 ..< 9 {
  r += powr(Rational(numerator: 1, denominator: i), 3)
  r.reduce()
}

// Print as a mixed number
print(r.mixed())

// Print approximation
print(r.doubleValue)
