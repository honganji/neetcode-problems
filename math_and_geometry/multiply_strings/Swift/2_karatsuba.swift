func multiply(_ num1: String, _ num2: String) -> String {
    // Digits are stored most significant first.
    let a = num1.utf8.map { Int($0) - 48 }
    let b = num2.utf8.map { Int($0) - 48 }
    return karatsuba(a, b).map { String($0) }.joined()
}

private func karatsuba(_ a: [Int], _ b: [Int]) -> [Int] {
    if a == [0] || b == [0] { return [0] }
    if a.count == 1 && b.count == 1 {
        let product = a[0] * b[0]
        return product < 10 ? [product] : [product / 10, product % 10]
    }

    // Split both numbers at the same place m from the right: x = high * 10^m + low.
    let m = max(a.count, b.count) / 2
    let aHigh = a.count > m ? Array(a.dropLast(m)) : [0]
    let aLow = strip(Array(a.suffix(m)))
    let bHigh = b.count > m ? Array(b.dropLast(m)) : [0]
    let bLow = strip(Array(b.suffix(m)))

    // Only three recursive products are needed instead of four.
    let zHigh = karatsuba(aHigh, bHigh)
    let zLow = karatsuba(aLow, bLow)
    // (aHigh + aLow)(bHigh + bLow) contains the cross terms, and subtracting the others leaves them.
    let zMid = sub(sub(karatsuba(add(aHigh, aLow), add(bHigh, bLow)), zHigh), zLow)

    return add(add(shift(zHigh, 2 * m), shift(zMid, m)), zLow)
}

private func strip(_ digits: [Int]) -> [Int] {
    var i = 0
    while i < digits.count - 1 && digits[i] == 0 { i += 1 }
    return Array(digits[i...])
}

private func shift(_ digits: [Int], _ k: Int) -> [Int] {
    // Multiplying by 10^k appends k zeros.
    if digits == [0] { return digits }
    return digits + [Int](repeating: 0, count: k)
}

private func add(_ a: [Int], _ b: [Int]) -> [Int] {
    var digits: [Int] = []
    var carry = 0
    var i = a.count - 1
    var j = b.count - 1
    while i >= 0 || j >= 0 || carry > 0 {
        var total = carry
        if i >= 0 {
            total += a[i]
            i -= 1
        }
        if j >= 0 {
            total += b[j]
            j -= 1
        }
        digits.append(total % 10)
        carry = total / 10
    }
    return Array(digits.reversed())
}

private func sub(_ a: [Int], _ b: [Int]) -> [Int] {
    // Requires a >= b.
    var digits: [Int] = []
    var borrow = 0
    var i = a.count - 1
    var j = b.count - 1
    while i >= 0 {
        var diff = a[i] - borrow
        i -= 1
        if j >= 0 {
            diff -= b[j]
            j -= 1
        }
        borrow = diff < 0 ? 1 : 0
        digits.append(diff < 0 ? diff + 10 : diff)
    }
    return strip(Array(digits.reversed()))
}
