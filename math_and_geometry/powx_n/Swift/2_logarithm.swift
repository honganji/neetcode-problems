import Foundation

func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 { return 1 }
    if x == 0 { return n > 0 ? 0 : Double.infinity }

    // x^n = e^(n * ln|x|), so the power becomes one multiply and one exp.
    let magnitude = exp(Double(n) * log(abs(x)))
    // An odd power of a negative number stays negative.
    let negative = x < 0 && n % 2 != 0
    return negative ? -magnitude : magnitude
}
