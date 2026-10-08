def car_fleet(target: int, position: list[int], speed: list[int]) -> int:
    cars = sorted(zip(position, speed), reverse=True)
    times = [(target - pos) / spd for pos, spd in cars]
    fleets = 0
    for i in range(len(times)):
        ahead = max(times[:i], default=0.0)
        if times[i] > ahead:
            fleets += 1
    return fleets
