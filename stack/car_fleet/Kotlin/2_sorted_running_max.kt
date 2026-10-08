fun carFleet(target: Int, position: IntArray, speed: IntArray): Int {
    val order = position.indices.sortedByDescending { position[it] }
    var fleets = 0
    var slowest = 0.0
    for (i in order) {
        val time = (target - position[i]).toDouble() / speed[i]
        if (time > slowest) {
            fleets++
            slowest = time
        }
    }
    return fleets
}
