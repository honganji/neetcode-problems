func encode(_ strs: [String]) -> String {
    var out = ""
    for s in strs {
        out += "\(s.utf8.count)#\(s)"
    }
    return out
}

func decode(_ s: String) -> [String] {
    let bytes = Array(s.utf8)
    let hash = UInt8(ascii: "#")
    var result = [String]()
    var i = 0
    while i < bytes.count {
        var j = i
        while bytes[j] != hash { j += 1 }
        let length = Int(String(decoding: bytes[i..<j], as: UTF8.self))!
        let start = j + 1
        result.append(String(decoding: bytes[start..<start + length], as: UTF8.self))
        i = start + length
    }
    return result
}
