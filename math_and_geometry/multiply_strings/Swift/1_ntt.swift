let mod = 998244353 // prime of the form c * 2^k + 1, so the roots of unity we need exist
let root = 3 // primitive root modulo mod

func multiply(_ num1: String, _ num2: String) -> String {
    if num1 == "0" || num2 == "0" { return "0" }

    // Little-endian digits: index 0 is the ones place.
    var size = 1
    while size < num1.utf8.count + num2.utf8.count { size *= 2 }
    var a = [Int](repeating: 0, count: size)
    var b = [Int](repeating: 0, count: size)
    for (i, ch) in num1.utf8.reversed().enumerated() { a[i] = Int(ch) - 48 }
    for (i, ch) in num2.utf8.reversed().enumerated() { b[i] = Int(ch) - 48 }

    // Multiplying digit lists is a convolution; the transform makes it a pointwise product.
    let fa = ntt(a, invert: false)
    let fb = ntt(b, invert: false)
    let c = ntt((0..<size).map { fa[$0] * fb[$0] % mod }, invert: true)

    // Each position may hold a value above 9, so carry it to the next place.
    var digits: [Int] = []
    var carry = 0
    for value in c {
        carry += value
        digits.append(carry % 10)
        carry /= 10
    }
    while carry > 0 {
        digits.append(carry % 10)
        carry /= 10
    }

    while digits.count > 1 && digits.last == 0 { digits.removeLast() }
    return digits.reversed().map { String($0) }.joined()
}

private func ntt(_ input: [Int], invert: Bool) -> [Int] {
    var arr = input
    let n = arr.count
    // Reorder entries into bit-reversed order.
    var j = 0
    for i in 1..<n {
        var bit = n >> 1
        while (j & bit) != 0 {
            j ^= bit
            bit >>= 1
        }
        j ^= bit
        if i < j { arr.swapAt(i, j) }
    }

    var length = 2
    while length <= n {
        let half = length / 2
        var w = powMod(root, (mod - 1) / length)
        if invert { w = powMod(w, mod - 2) }
        for start in stride(from: 0, to: n, by: length) {
            var wn = 1
            for k in 0..<half {
                let u = arr[start + k]
                let v = arr[start + k + half] * wn % mod
                arr[start + k] = (u + v) % mod
                arr[start + k + half] = (u - v + mod) % mod
                wn = wn * w % mod
            }
        }
        length *= 2
    }

    if invert {
        let invN = powMod(n, mod - 2)
        for i in 0..<n { arr[i] = arr[i] * invN % mod }
    }
    return arr
}

private func powMod(_ base: Int, _ exp: Int) -> Int {
    var result = 1
    var b = base % mod
    var e = exp
    while e > 0 {
        if (e & 1) == 1 { result = result * b % mod }
        b = b * b % mod
        e >>= 1
    }
    return result
}
