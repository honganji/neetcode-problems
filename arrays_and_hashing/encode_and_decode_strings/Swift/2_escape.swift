func encode(_ strs: [String]) -> String {
    var out = ""
    for s in strs {
        for ch in s {
            if ch == "/" {
                out += "//"
            } else {
                out.append(ch)
            }
        }
        out += "/:"
    }
    return out
}

func decode(_ s: String) -> [String] {
    let chars = Array(s)
    var result = [String]()
    var current = ""
    var i = 0
    while i < chars.count {
        if chars[i] == "/" {
            if chars[i + 1] == "/" {
                current.append("/")
            } else {
                result.append(current)
                current = ""
            }
            i += 2
        } else {
            current.append(chars[i])
            i += 1
        }
    }
    return result
}
