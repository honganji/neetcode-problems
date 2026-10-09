class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var nextCourses = Array(repeating: [Int](), count: numCourses)
        for pair in prerequisites {
            nextCourses[pair[1]].append(pair[0])
        }

        // 0 = unvisited, 1 = on the current path, 2 = finished
        var state = Array(repeating: 0, count: numCourses)
        var order: [Int] = [] // a course is added after every course that depends on it

        func dfs(_ course: Int) -> Bool {
            if state[course] == 1 { return false } // back to the current path -> cycle
            if state[course] == 2 { return true }
            state[course] = 1
            for next in nextCourses[course] {
                if !dfs(next) { return false }
            }
            state[course] = 2
            order.append(course)
            return true
        }

        for course in 0..<numCourses {
            if !dfs(course) { return [] }
        }
        // Reversed post-order puts prerequisites before the courses that need them
        return order.reversed()
    }
}
