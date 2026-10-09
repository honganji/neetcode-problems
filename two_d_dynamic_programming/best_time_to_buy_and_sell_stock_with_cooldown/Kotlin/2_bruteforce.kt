import kotlin.math.max

class Solution {
    fun maxProfit(prices: IntArray): Int {
        val n = prices.size

        // Best profit from this day onward, given whether we hold a share and
        // whether yesterday was a sell (which blocks buying today).
        fun explore(day: Int, holding: Boolean, cooling: Boolean): Int {
            if (day == n) return 0 // an unsold share at the end is never better than not buying it

            var best = explore(day + 1, holding, false) // do nothing today

            if (holding) {
                best = max(best, prices[day] + explore(day + 1, false, true)) // sell
            } else if (!cooling) {
                best = max(best, -prices[day] + explore(day + 1, true, false)) // buy
            }

            return best
        }

        return explore(0, false, false)
    }
}
