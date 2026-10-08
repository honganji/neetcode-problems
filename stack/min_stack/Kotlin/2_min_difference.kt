class MinStack() {
    private val stack = ArrayDeque<Long>()
    private var minVal = 0L

    fun push(`val`: Int) {
        if (stack.isEmpty()) {
            stack.addLast(0L)
            minVal = `val`.toLong()
            return
        }
        stack.addLast(`val` - minVal)
        if (`val` < minVal) {
            minVal = `val`.toLong()
        }
    }

    fun pop() {
        val diff = stack.removeLast()
        if (diff < 0) {
            minVal -= diff
        }
    }

    fun top(): Int {
        val diff = stack.last()
        if (diff < 0) {
            return minVal.toInt()
        }
        return (minVal + diff).toInt()
    }

    fun getMin(): Int {
        return minVal.toInt()
    }
}
