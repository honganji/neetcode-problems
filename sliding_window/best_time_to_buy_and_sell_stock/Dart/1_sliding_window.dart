int maxProfit(List<int> prices) {
  var left = 0;
  var right = 1;
  var best = 0;
  while (right < prices.length) {
    if (prices[right] < prices[left]) {
      left = right;
    } else {
      final profit = prices[right] - prices[left];
      if (profit > best) {
        best = profit;
      }
    }
    right++;
  }
  return best;
}
