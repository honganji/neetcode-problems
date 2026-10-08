class MinStack {
    private var stack: [Int] = []
    private var minVal = 0

    init() {}

    func push(_ val: Int) {
        if stack.isEmpty {
            stack.append(0)
            minVal = val
            return
        }
        stack.append(val - minVal)
        if val < minVal {
            minVal = val
        }
    }

    func pop() {
        let diff = stack.removeLast()
        if diff < 0 {
            minVal -= diff
        }
    }

    func top() -> Int {
        let diff = stack.last!
        if diff < 0 {
            return minVal
        }
        return minVal + diff
    }

    func getMin() -> Int {
        return minVal
    }
}
