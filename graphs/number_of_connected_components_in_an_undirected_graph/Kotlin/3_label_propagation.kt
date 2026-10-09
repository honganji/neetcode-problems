class Solution {
    fun countComponents(n: Int, edges: Array<IntArray>): Int {
        // Every node starts out labeled with its own number.
        val label = IntArray(n) { it }

        // Keep letting edge endpoints adopt the smaller label until nothing changes.
        var changed = true
        while (changed) {
            changed = false
            for (edge in edges) {
                val a = edge[0]
                val b = edge[1]
                val low = minOf(label[a], label[b])
                if (label[a] != low || label[b] != low) {
                    label[a] = low
                    label[b] = low
                    changed = true
                }
            }
        }

        // Each component ends up labeled with its smallest node,
        // so the nodes still holding their own number are one per component.
        return (0 until n).count { label[it] == it }
    }
}
