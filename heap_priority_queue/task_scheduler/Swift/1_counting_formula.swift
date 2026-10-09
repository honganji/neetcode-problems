class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var counts = [Character: Int]()
        for task in tasks {
            counts[task, default: 0] += 1
        }
        let maxFreq = counts.values.max() ?? 0
        // How many letters tie for the highest count
        let maxCount = counts.values.filter { $0 == maxFreq }.count

        // (maxFreq - 1) gaps of size n + 1, plus one final slot per tied letter
        let formula = (maxFreq - 1) * (n + 1) + maxCount
        // If there are more tasks than the layout holds, no idle time is needed
        return max(tasks.count, formula)
    }
}
