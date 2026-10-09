class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = Array(repeating: [Int](), count: numCourses)
        for pair in prerequisites {
            graph[pair[0]].append(pair[1])
        }

        // 0 = not visited, 1 = on the current DFS path, 2 = fully explored
        var state = Array(repeating: 0, count: numCourses)
        var nextEdge = Array(repeating: 0, count: numCourses)  // next prerequisite to check per course

        // Iterative DFS with an explicit stack.
        for start in 0..<numCourses where state[start] == 0 {
            state[start] = 1
            var stack = [start]
            while let node = stack.last {
                if nextEdge[node] < graph[node].count {
                    let next = graph[node][nextEdge[node]]
                    nextEdge[node] += 1
                    if state[next] == 1 { return false }  // back edge to the current path -> cycle
                    if state[next] == 0 {
                        state[next] = 1
                        stack.append(next)
                    }
                } else {
                    state[node] = 2
                    stack.removeLast()
                }
            }
        }
        return true
    }
}
