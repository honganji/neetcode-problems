class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        if hand.count % groupSize != 0 { return false }

        var counts: [Int: Int] = [:]
        for card in hand {
            counts[card, default: 0] += 1
        }

        // Walk the distinct values from smallest to largest.
        for start in counts.keys.sorted() {
            let c = counts[start, default: 0]
            if c == 0 { continue }
            // The smallest value left must start all of its remaining groups.
            for v in start..<(start + groupSize) {
                let have = counts[v, default: 0]
                if have < c { return false }
                counts[v] = have - c
            }
        }
        return true
    }
}
