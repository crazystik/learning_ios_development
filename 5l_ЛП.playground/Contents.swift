import Foundation

enum EngineState {
    case on
    case off
}

extension EngineState: CustomStringConvertible {
    var description: String {
        switch self {
        case .on:
            return "запущен"
        case .off:
            return "не запущен"
        }
    }
}

enum WindowsState {
    case open
    case close
}

extension WindowsState: CustomStringConvertible {
    var description: String {
        switch self {
        case .open:
            return "открыты"
        case .close:
            return "закрыты"
        }
    }
}

protocol Car {
    var brand: String {get}
    var yearOfManufacture: Int {get}
    var engine: EngineState {get set}
    var windows: WindowsState {get set}
}

extension Car {
    mutating func closeWindows() {
        windows = .close
    }
    
    mutating func openWindows() {
        windows = .open
    }
    
    mutating func engineTurnOff() {
        engine = .off
    }
    
    mutating func engineTurnOn() {
        engine = .on
    }
}

class SportCar: Car {
    var brand: String
    var yearOfManufacture: Int
    var engine: EngineState = .off
    var windows: WindowsState = .close
    var turbine: Turbine
    var engineVolume: Double
    
    enum Turbine {
        case yes(name: String)
        case no
    }

    init(
        brand: String,
        yearOfManufacture: Int,
        turbine: Turbine = .no,
        engineVolume: Double
    ) {
        self.brand = brand
        self.yearOfManufacture = yearOfManufacture
        self.turbine = turbine
        self.engineVolume = engineVolume
    }
}

extension SportCar.Turbine: CustomStringConvertible {
    var description: String {
        switch self {
        case .yes(let name):
            return "есть \(name)"
        case .no:
            return "нет"
        }
    }
}


extension SportCar {
    func setNewTurbine(name: String) {
        self.turbine = .yes(name: name)
    }
    
    func removeTurbine() {
        self.turbine = .no
    }
    
    func setNewEngine(volume: Double) {
        if volume <= 0 {
            print("двигателя такого объёма нет")
            return
        }
        engineVolume = volume
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "марка: \(brand), год выпуска: \(yearOfManufacture), двигатель \(engine.description), окна \(windows.description), объем двигателя: \(engineVolume), турбина \(turbine.description)"
    }
}

class TrunkCar: Car {
    var brand: String
    var yearOfManufacture: Int
    var engine: EngineState = .off
    var windows: WindowsState = .close
    var trunk: Trunk
    var maxTrunkVolume: Double
    var filledTrunkVolume: Double = 0
    
    enum Trunk {
        case empty(message: String)
        case full(messege: String)
        case part(of: Double)
    }
    
    init(
        brand: String,
        yearOfManufacture: Int,
        trunk: Trunk = .empty(
            message: "Пустой"
        ),
        maxTrunkVolume: Double
    ) {
        self.brand = brand
        self.yearOfManufacture = yearOfManufacture
        self.maxTrunkVolume = maxTrunkVolume
        self.trunk = trunk
    }
}

extension TrunkCar.Trunk: CustomStringConvertible {
    var description: String {
        switch self {
        case .empty(message: let message):
            return message
        case .full(messege: let messege):
            return messege
        case .part(of: let part):
            return "Заполнен на \(part)"
        }
    }
}

extension TrunkCar {
    func fill(trunk: Trunk) {
        self.trunk = trunk
        switch trunk {
        case .empty(message: _):
            filledTrunkVolume = 0
        case .part(of: let part):
            filledTrunkVolume = part
        case .full(messege: _):
            filledTrunkVolume = maxTrunkVolume
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "марка: \(brand), год выпуска: \(yearOfManufacture), двигатель \(engine.description), окна \(windows.description), багажник \(trunk.description)"
    }
}

var trunkCar = TrunkCar(
    brand: "Volvo",
    yearOfManufacture: 1995,
    maxTrunkVolume: 598
)
print(trunkCar.description)
trunkCar.fill(trunk: .part(of: 100))
print(trunkCar.description)
trunkCar.fill(trunk: .full(messege: "заполнен"))
print(trunkCar.description)
trunkCar.engineTurnOn()
print(trunkCar.description)
trunkCar.openWindows()
print(trunkCar.description)
trunkCar.closeWindows()
print(trunkCar.description)
trunkCar.engineTurnOff()
print(trunkCar.description)


var sportCar = SportCar(brand: "Audi", yearOfManufacture: 2020, engineVolume: 5.0)
print(sportCar.description)
sportCar.setNewEngine(volume: 0)
print(sportCar.description)
sportCar.setNewEngine(volume: 3.5)
print(sportCar.description)
sportCar.setNewTurbine(name: "Pulsar Turbo")
print(sportCar.description)
sportCar.openWindows()
print(sportCar.description)
sportCar.engineTurnOn()
print(sportCar.description)
sportCar.engineTurnOff()
print(sportCar.description)
sportCar.removeTurbine()
print(sportCar.description)
sportCar.closeWindows()
print(sportCar.description)
