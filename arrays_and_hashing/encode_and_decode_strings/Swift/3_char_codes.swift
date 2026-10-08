func encode(_ strs: [String]) -> String {
    var out = ""
    for s in strs {
        out += s.utf8.map { String($0) }.joined(separator: ",")
        out += ";"
    }
    return out
}

func decode(_ s: String) -> [String] {
    var result = [String]()
    let chunks = s.split(separator: ";", omittingEmptySubsequences: false)
    for chunk in chunks.dropLast() {
        if chunk.isEmpty {
            result.append("")
        } else {
            let bytes = chunk.split(separator: ",").map { UInt8($0)! }
            result.append(String(decoding: bytes, as: UTF8.self))
        }
    }
    return result
}
