class Solution {
    fun isNStraightHand(hand: IntArray, groupSize: Int): Boolean {
        if (hand.size % groupSize != 0) return false

        val counts = HashMap<Int, Int>()
        for (card in hand) counts[card] = (counts[card] ?: 0) + 1

        // Walk the distinct values from smallest to largest.
        for (start in counts.keys.sorted()) {
            val c = counts[start] ?: 0
            if (c == 0) continue
            // The smallest value left must start all of its remaining groups.
            for (v in start until start + groupSize) {
                val have = counts[v] ?: 0
                if (have < c) return false
                counts[v] = have - c
            }
        }
        return true
    }
}
