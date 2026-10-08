func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    let order = position.indices.sorted { position[$0] > position[$1] }
    let times = order.map { Double(target - position[$0]) / Double(speed[$0]) }
    var fleets = 0
    for i in 0..<times.count {
        var ahead = 0.0
        for j in 0..<i {
            if times[j] > ahead {
                ahead = times[j]
            }
        }
        if times[i] > ahead {
            fleets += 1
        }
    }
    return fleets
}
