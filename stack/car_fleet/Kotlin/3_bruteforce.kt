fun carFleet(target: Int, position: IntArray, speed: IntArray): Int {
    val order = position.indices.sortedByDescending { position[it] }
    val times = order.map { (target - position[it]).toDouble() / speed[it] }
    var fleets = 0
    for (i in times.indices) {
        var ahead = 0.0
        for (j in 0 until i) {
            if (times[j] > ahead) {
                ahead = times[j]
            }
        }
        if (times[i] > ahead) {
            fleets++
        }
    }
    return fleets
}
