import kotlin.random.Random

fun kClosest(points: Array<IntArray>, k: Int): Array<IntArray> {
    fun dist(p: IntArray) = p[0] * p[0] + p[1] * p[1]

    var left = 0
    var right = points.size - 1
    while (left <= right) {
        // Pick a random pivot and move it to the end of the range.
        val pivotIdx = Random.nextInt(left, right + 1)
        val pivot = dist(points[pivotIdx])
        points.swap(pivotIdx, right)

        // Move every point closer than the pivot to the front of the range.
        var store = left
        for (i in left until right) {
            if (dist(points[i]) < pivot) {
                points.swap(store, i)
                store++
            }
        }

        // The pivot is now in its final place; everything before it is closer.
        points.swap(store, right)

        if (store == k) break
        if (store < k) left = store + 1 else right = store - 1
    }
    return points.copyOfRange(0, k)
}

private fun Array<IntArray>.swap(i: Int, j: Int) {
    val tmp = this[i]
    this[i] = this[j]
    this[j] = tmp
}
