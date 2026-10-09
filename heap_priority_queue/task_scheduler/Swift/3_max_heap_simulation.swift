class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var counts = [Character: Int]()
        for task in tasks {
            counts[task, default: 0] += 1
        }

        // Swift has no built-in heap. There are at most 26 values, so a sorted
        // array works fine: the largest remaining count is always the last one.
        var available = Array(counts.values).sorted()
        // (remaining count, time it becomes ready again) — a queue read by index
        var cooldown: [(count: Int, readyAt: Int)] = []
        var head = 0

        var time = 0
        while !available.isEmpty || head < cooldown.count {
            time += 1
            // A task that finished its cooldown goes back into the list
            if head < cooldown.count && cooldown[head].readyAt == time {
                available.append(cooldown[head].count)
                available.sort()
                head += 1
            }
            if let top = available.popLast() {
                let remaining = top - 1  // run one copy
                if remaining > 0 {
                    cooldown.append((count: remaining, readyAt: time + n + 1))
                }
            }
            // If nothing is available, this slot is idle
        }
        return time
    }
}
