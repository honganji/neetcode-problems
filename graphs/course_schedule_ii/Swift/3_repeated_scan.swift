class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var prereqs = Array(repeating: [Int](), count: numCourses)
        for pair in prerequisites {
            prereqs[pair[0]].append(pair[1])
        }

        var taken = Array(repeating: false, count: numCourses)
        var order: [Int] = []
        while order.count < numCourses {
            var progress = false
            for course in 0..<numCourses where !taken[course] {
                if prereqs[course].allSatisfy({ taken[$0] }) {
                    taken[course] = true
                    order.append(course)
                    progress = true
                }
            }
            // Nothing could be taken, so every remaining course waits on another one -> cycle
            if !progress { return [] }
        }
        return order
    }
}
