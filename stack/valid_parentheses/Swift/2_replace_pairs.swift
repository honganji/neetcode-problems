import Foundation

func isValid(_ s: String) -> Bool {
    var current = s
    while true {
        let reduced = current
            .replacingOccurrences(of: "()", with: "")
            .replacingOccurrences(of: "[]", with: "")
            .replacingOccurrences(of: "{}", with: "")
        if reduced == current {
            return current.isEmpty
        }
        current = reduced
    }
}
