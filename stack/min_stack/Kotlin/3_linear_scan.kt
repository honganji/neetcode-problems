class MinStack() {
    private val stack = ArrayDeque<Int>()

    fun push(`val`: Int) {
        stack.addLast(`val`)
    }

    fun pop() {
        stack.removeLast()
    }

    fun top(): Int {
        return stack.last()
    }

    fun getMin(): Int {
        return stack.min()
    }
}
