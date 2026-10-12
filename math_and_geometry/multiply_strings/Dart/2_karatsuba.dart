String multiply(String num1, String num2) => _karatsuba(num1, num2);

String _karatsuba(String a, String b) {
  if (a == '0' || b == '0') return '0';
  if (a.length == 1 && b.length == 1) {
    return (int.parse(a) * int.parse(b)).toString();
  }

  // Split both numbers at the same place m from the right: x = high * 10^m + low.
  final longest = a.length > b.length ? a.length : b.length;
  final m = longest ~/ 2;
  final aHigh = a.length > m ? a.substring(0, a.length - m) : '0';
  final aLow = _strip(a.length > m ? a.substring(a.length - m) : a);
  final bHigh = b.length > m ? b.substring(0, b.length - m) : '0';
  final bLow = _strip(b.length > m ? b.substring(b.length - m) : b);

  // Only three recursive products are needed instead of four.
  final zHigh = _karatsuba(aHigh, bHigh);
  final zLow = _karatsuba(aLow, bLow);
  // (aHigh + aLow)(bHigh + bLow) contains the cross terms, and subtracting the others leaves them.
  final zMid = _sub(
    _sub(_karatsuba(_add(aHigh, aLow), _add(bHigh, bLow)), zHigh),
    zLow,
  );

  return _add(_add(_shift(zHigh, 2 * m), _shift(zMid, m)), zLow);
}

String _strip(String s) {
  var i = 0;
  while (i < s.length - 1 && s[i] == '0') {
    i++;
  }
  return s.substring(i);
}

String _shift(String s, int k) {
  // Multiplying by 10^k appends k zeros.
  return s == '0' ? s : s + '0' * k;
}

String _add(String a, String b) {
  final digits = <int>[];
  var carry = 0;
  var i = a.length - 1;
  var j = b.length - 1;
  while (i >= 0 || j >= 0 || carry > 0) {
    var total = carry;
    if (i >= 0) {
      total += a.codeUnitAt(i) - 48;
      i--;
    }
    if (j >= 0) {
      total += b.codeUnitAt(j) - 48;
      j--;
    }
    digits.add(total % 10);
    carry = total ~/ 10;
  }
  return digits.reversed.map((d) => d.toString()).join();
}

String _sub(String a, String b) {
  // Requires a >= b.
  final digits = <int>[];
  var borrow = 0;
  var i = a.length - 1;
  var j = b.length - 1;
  while (i >= 0) {
    var diff = a.codeUnitAt(i) - 48 - borrow;
    i--;
    if (j >= 0) {
      diff -= b.codeUnitAt(j) - 48;
      j--;
    }
    borrow = diff < 0 ? 1 : 0;
    digits.add(diff < 0 ? diff + 10 : diff);
  }
  return _strip(digits.reversed.map((d) => d.toString()).join());
}
