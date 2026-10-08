fun generateParenthesis(n: Int): List<String> {
    val table = mutableListOf<List<String>>(listOf(""))
    for (size in 1..n) {
        val combos = mutableListOf<String>()
        for (inner in 0 until size) {
            for (left in table[inner]) {
                for (right in table[size - 1 - inner]) {
                    combos.add("($left)$right")
                }
            }
        }
        table.add(combos)
    }
    return table[n]
}
