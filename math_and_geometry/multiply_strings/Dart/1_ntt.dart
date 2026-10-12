const int mod = 998244353; // prime of the form c * 2^k + 1, so the roots of unity we need exist
const int root = 3; // primitive root modulo mod

String multiply(String num1, String num2) {
  if (num1 == '0' || num2 == '0') return '0';

  // Little-endian digits: index 0 is the ones place.
  var size = 1;
  while (size < num1.length + num2.length) {
    size *= 2;
  }
  final a = List<int>.filled(size, 0);
  final b = List<int>.filled(size, 0);
  for (var i = 0; i < num1.length; i++) {
    a[i] = num1.codeUnitAt(num1.length - 1 - i) - 48;
  }
  for (var i = 0; i < num2.length; i++) {
    b[i] = num2.codeUnitAt(num2.length - 1 - i) - 48;
  }

  // Multiplying digit lists is a convolution; the transform makes it a pointwise product.
  final fa = _ntt(a, false);
  final fb = _ntt(b, false);
  final fc = List<int>.generate(size, (i) => fa[i] * fb[i] % mod);
  final c = _ntt(fc, true);

  // Each position may hold a value above 9, so carry it to the next place.
  final digits = <int>[];
  var carry = 0;
  for (final value in c) {
    carry += value;
    digits.add(carry % 10);
    carry ~/= 10;
  }
  while (carry > 0) {
    digits.add(carry % 10);
    carry ~/= 10;
  }

  while (digits.length > 1 && digits.last == 0) {
    digits.removeLast();
  }
  return digits.reversed.map((d) => d.toString()).join();
}

List<int> _ntt(List<int> arr, bool invert) {
  final n = arr.length;
  // Reorder entries into bit-reversed order.
  var j = 0;
  for (var i = 1; i < n; i++) {
    var bit = n >> 1;
    while ((j & bit) != 0) {
      j ^= bit;
      bit >>= 1;
    }
    j ^= bit;
    if (i < j) {
      final tmp = arr[i];
      arr[i] = arr[j];
      arr[j] = tmp;
    }
  }

  for (var length = 2; length <= n; length <<= 1) {
    final half = length >> 1;
    var w = _powMod(root, (mod - 1) ~/ length);
    if (invert) w = _powMod(w, mod - 2);
    for (var start = 0; start < n; start += length) {
      var wn = 1;
      for (var k = 0; k < half; k++) {
        final u = arr[start + k];
        final v = arr[start + k + half] * wn % mod;
        arr[start + k] = (u + v) % mod;
        arr[start + k + half] = (u - v + mod) % mod;
        wn = wn * w % mod;
      }
    }
  }

  if (invert) {
    final invN = _powMod(n, mod - 2);
    return [for (final x in arr) x * invN % mod];
  }
  return arr;
}

int _powMod(int base, int exp) {
  var result = 1;
  var b = base % mod;
  var e = exp;
  while (e > 0) {
    if ((e & 1) == 1) result = result * b % mod;
    b = b * b % mod;
    e >>= 1;
  }
  return result;
}
