int maxProfit(List<int> prices) {
  var minPrice = prices[0];
  var best = 0;
  for (final price in prices) {
    if (price < minPrice) {
      minPrice = price;
    } else if (price - minPrice > best) {
      best = price - minPrice;
    }
  }
  return best;
}
