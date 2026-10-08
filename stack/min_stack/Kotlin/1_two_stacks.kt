class MinStack() {
    private val stack = ArrayDeque<Int>()
    private val minStack = ArrayDeque<Int>()

    fun push(`val`: Int) {
        stack.addLast(`val`)
        val currentMin = minStack.lastOrNull()
        if (currentMin != null && currentMin < `val`) {
            minStack.addLast(currentMin)
        } else {
            minStack.addLast(`val`)
        }
    }

    fun pop() {
        stack.removeLast()
        minStack.removeLast()
    }

    fun top(): Int {
        return stack.last()
    }

    fun getMin(): Int {
        return minStack.last()
    }
}
