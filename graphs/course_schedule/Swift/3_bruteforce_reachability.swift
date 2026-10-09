class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        // Edge prerequisite -> course.
        var graph = Array(repeating: [Int](), count: numCourses)
        for pair in prerequisites {
            graph[pair[1]].append(pair[0])
        }

        // A course is on a cycle if we can walk from it back to itself.
        func reachesItself(_ start: Int) -> Bool {
            var seen = Set<Int>()
            var stack = graph[start]
            while let node = stack.popLast() {
                if node == start { return true }
                if !seen.insert(node).inserted { continue }
                stack.append(contentsOf: graph[node])
            }
            return false
        }

        for course in 0..<numCourses {
            if reachesItself(course) { return false }
        }
        return true
    }
}
