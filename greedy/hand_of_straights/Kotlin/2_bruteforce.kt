class Solution {
    fun isNStraightHand(hand: IntArray, groupSize: Int): Boolean {
        if (hand.size % groupSize != 0) return false

        val cards = hand.toMutableList()
        while (cards.isNotEmpty()) {
            // The smallest remaining card must start the next group.
            val lowest = cards.min()
            for (v in lowest until lowest + groupSize) {
                if (!cards.remove(v)) return false
            }
        }
        return true
    }
}
