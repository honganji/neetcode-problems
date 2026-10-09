import 'dart:math';

class Solution {
  int maxProfit(List<int> prices) {
    // Each day we are in one of three states, and we track the best profit for each:
    var hold = -prices[0]; // holding a share (we paid for it)
    var sold = 0; // we sold today, so tomorrow is a cooldown day
    var rest = 0; // not holding, and free to buy

    for (var i = 1; i < prices.length; i++) {
      final price = prices[i];
      final prevSold = sold;
      // Update in an order that still sees yesterday's values.
      sold = hold + price;
      hold = max(hold, rest - price);
      rest = max(rest, prevSold);
    }

    return max(sold, rest);
  }
}
