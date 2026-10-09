class Solution {
  int reverseBits(int n) {
    // Take bits off n from the lowest end and push each one onto the
    // bottom of the result. The first bit read ends up at the top.
    var bits = n;
    var result = 0;
    for (var i = 0; i < 32; i++) {
      result = (result << 1) | (bits & 1);
      bits >>= 1;
    }
    return result;
  }
}
