func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    let order = position.indices.sorted { position[$0] > position[$1] }
    var stack = [Double]()
    for i in order {
        let time = Double(target - position[i]) / Double(speed[i])
        if let top = stack.last, time <= top {
            continue
        }
        stack.append(time)
    }
    return stack.count
}
