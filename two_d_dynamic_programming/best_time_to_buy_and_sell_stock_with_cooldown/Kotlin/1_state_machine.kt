import kotlin.math.max

class Solution {
    fun maxProfit(prices: IntArray): Int {
        // Each day we are in one of three states, and we track the best profit for each:
        var hold = -prices[0] // holding a share (we paid for it)
        var sold = 0 // we sold today, so tomorrow is a cooldown day
        var rest = 0 // not holding, and free to buy

        for (i in 1 until prices.size) {
            val price = prices[i]
            val prevSold = sold
            // Update in an order that still sees yesterday's values.
            sold = hold + price
            hold = max(hold, rest - price)
            rest = max(rest, prevSold)
        }

        return max(sold, rest)
    }
}
