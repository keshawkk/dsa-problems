protocol Vehicle {
    func getType() -> String
}

class Car: Vehicle {
    func getType() -> String {
        return "Car"
    }
}

class Bike: Vehicle {
    func getType() -> String {
        return "Bike"
    }
}

class Truck: Vehicle {
    func getType() -> String {
        return "Truck"
    }
}

class VehicleFactory {
    func createVehicle() -> Vehicle {
        fatalError("Subclasses must override")
    }
}

class CarFactory: VehicleFactory {
    override func createVehicle() -> Vehicle {
        return Car()
    }
}

class BikeFactory: VehicleFactory {
    override func createVehicle() -> Vehicle {
        return Bike()
    }
}

class TruckFactory: VehicleFactory {
    override func createVehicle() -> Vehicle {
        return Truck()
    }
}
