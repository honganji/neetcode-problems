bool isAnagram(String s, String t) {
    if (s.length != t.length) return false;
    final sortedS = String.fromCharCodes(s.codeUnits.toList()..sort());
    final sortedT = String.fromCharCodes(t.codeUnits.toList()..sort());
    for (var i = 0; i < s.length; i++) {
        if (sortedS.codeUnitAt(i) != sortedT.codeUnitAt(i)) {
            return false;
        }
    }
    return true;
}