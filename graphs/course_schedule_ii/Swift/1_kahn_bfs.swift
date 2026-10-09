class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        // nextCourses[p] = courses that get one step closer to unlocked once p is taken
        var nextCourses = Array(repeating: [Int](), count: numCourses)
        var indegree = Array(repeating: 0, count: numCourses) // unfinished prerequisites per course
        for pair in prerequisites {
            nextCourses[pair[1]].append(pair[0])
            indegree[pair[0]] += 1
        }

        // `order` doubles as the BFS queue: entries from `head` onward are waiting to be processed
        var order = (0..<numCourses).filter { indegree[$0] == 0 }
        var head = 0
        while head < order.count {
            let course = order[head]
            head += 1
            for next in nextCourses[course] {
                indegree[next] -= 1
                if indegree[next] == 0 {
                    order.append(next)
                }
            }
        }

        // Courses left out are stuck in a cycle
        return order.count == numCourses ? order : []
    }
}
