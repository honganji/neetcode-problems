class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = Array(repeating: [Int](), count: numCourses)
        var indegree = Array(repeating: 0, count: numCourses)  // prerequisites each course still waits on
        for pair in prerequisites {
            graph[pair[1]].append(pair[0])
            indegree[pair[0]] += 1
        }

        // Start with courses that have no prerequisites. Swift has no built-in deque,
        // so the array doubles as a queue with a moving head index.
        var queue = (0..<numCourses).filter { indegree[$0] == 0 }
        var head = 0
        while head < queue.count {
            let node = queue[head]
            head += 1
            for next in graph[node] {
                indegree[next] -= 1
                if indegree[next] == 0 {
                    queue.append(next)
                }
            }
        }

        // Courses in a cycle never reach zero prerequisites, so they are never queued.
        return queue.count == numCourses
    }
}
