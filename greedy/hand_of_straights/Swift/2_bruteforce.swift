class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        if hand.count % groupSize != 0 { return false }

        var cards = hand
        while !cards.isEmpty {
            // The smallest remaining card must start the next group.
            let lowest = cards.min()!
            for v in lowest..<(lowest + groupSize) {
                guard let i = cards.firstIndex(of: v) else { return false }
                cards.remove(at: i)
            }
        }
        return true
    }
}
