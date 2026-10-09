class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var counts = [Int](repeating: 0, count: 26)
        let aValue = Int(Character("A").asciiValue!)
        for task in tasks {
            counts[Int(task.asciiValue!) - aValue] += 1
        }

        var time = 0
        var left = tasks.count
        while left > 0 {
            // Most frequent letters first, so each block takes the busiest tasks
            counts.sort(by: >)
            var slots = n + 1  // one block = n + 1 slots
            for i in 0..<26 {
                if slots == 0 || counts[i] == 0 { break }
                counts[i] -= 1
                slots -= 1
                left -= 1
                time += 1
            }
            if left > 0 { time += slots }  // idle for the rest of the block
        }
        return time
    }
}
