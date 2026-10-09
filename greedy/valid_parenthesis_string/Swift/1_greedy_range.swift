func checkValidString(_ s: String) -> Bool {
    // lo and hi are the fewest and most "(" that could still be open so far.
    var lo = 0
    var hi = 0
    for c in s {
        switch c {
        case "(":
            lo += 1
            hi += 1
        case ")":
            lo -= 1
            hi -= 1
        default:
            // "*" can close one "(" (lo - 1), open one (hi + 1), or be empty.
            lo -= 1
            hi += 1
        }
        // Even treating every "*" as "(" there is no "(" left for a ")".
        if hi < 0 { return false }
        lo = max(lo, 0)  // a "*" can always be empty, so lo never goes below 0
    }
    return lo == 0
}
