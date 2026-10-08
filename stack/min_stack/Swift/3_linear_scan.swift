class MinStack {
    private var stack: [Int] = []

    init() {}

    func push(_ val: Int) {
        stack.append(val)
    }

    func pop() {
        stack.removeLast()
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return stack.min()!
    }
}
