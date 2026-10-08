def car_fleet(target: int, position: list[int], speed: list[int]) -> int:
    cars = sorted(zip(position, speed), reverse=True)
    fleets = 0
    slowest = 0.0
    for pos, spd in cars:
        time = (target - pos) / spd
        if time > slowest:
            fleets += 1
            slowest = time
    return fleets
