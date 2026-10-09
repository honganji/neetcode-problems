int maxProfit(List<int> prices) {
  var best = 0;
  for (var i = 0; i < prices.length; i++) {
    for (var j = i + 1; j < prices.length; j++) {
      final profit = prices[j] - prices[i];
      if (profit > best) {
        best = profit;
      }
    }
  }
  return best;
}
