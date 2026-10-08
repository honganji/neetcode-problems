func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    let order = position.indices.sorted { position[$0] > position[$1] }
    var fleets = 0
    var slowest = 0.0
    for i in order {
        let time = Double(target - position[i]) / Double(speed[i])
        if time > slowest {
            fleets += 1
            slowest = time
        }
    }
    return fleets
}
