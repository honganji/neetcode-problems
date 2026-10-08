class MinStack {
    private var stack: [Int] = []
    private var minStack: [Int] = []

    init() {}

    func push(_ val: Int) {
        stack.append(val)
        if let currentMin = minStack.last, currentMin < val {
            minStack.append(currentMin)
        } else {
            minStack.append(val)
        }
    }

    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return minStack.last!
    }
}
