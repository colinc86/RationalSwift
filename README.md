# RationalSwift

A rational number library for the Swift language.

## Usage
See the method documentation for more information.

#### Basic arithmetic
```swift
// Operators
let r1 = Rational(numerator: 2, denominator: 3)
let r2 = Rational(numerator: 3, denominator: 5)

let a = r1 + r2
print(a) // 19/15

let b = r1 - r2
print(b) // 1/15

let c = r1 * r2
print(c) // 6/15

let d = r1 / r2
print(d) // 10/9

// Find a rational approximation of Zeta(3)
var r: Rational = 1
for i in 2 ..< 9 {
  r += powr(Rational(numerator: 1, denominator: i), 3)
  r.reduce()
}
```