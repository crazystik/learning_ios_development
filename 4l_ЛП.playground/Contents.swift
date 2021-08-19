import Foundation

class Car {
    let brand: String
    let yearOfManufacture: Int
    var engine: Engine = .off
    var windows: Windows = .close
    
    enum Engine: String {
        case on
        case off
    }

    enum Windows: String {
        case open
        case close
    }
    
    enum Turbine {
        case yes
        case no
    }
    
    enum Action {
        case switchEngine(Engine)
        case switchWindows(Windows)
        case load(Double)
        case setTurbine(Turbine)
    }
    
    init(brand: String, yearOfManufacture: Int) {
        self.brand = brand
        self.yearOfManufacture = yearOfManufacture
    }
    
    func perform(action: Action) {}
}

class SportCar: Car {
    var turbine: Turbine
    private var engineVolume: Double
    
    init(brand: String, yearOfManufacture: Int, turbine: Turbine = .no, engineVolume: Double) {
        self.turbine = turbine
        self.engineVolume = engineVolume
        super.init(brand: brand, yearOfManufacture: yearOfManufacture)
    }
    
    override func perform(action: Car.Action) {
        switch action {
        case .setTurbine(let turbine):
            self.turbine = turbine
        default:
            print("no changes")
            break
        }
    }
    
    func printEngineVolume() {
        print(engineVolume)
    }
    
    func printTurbinState() {
        print("Turbine is \(turbine)")
    }
}

class TrunkCar: Car {
    var trunk: Trunk
    var maxTrunkVolume: Double
    var filledTrunkVolume: Double = 0
    
    enum Trunk {
        case empty(message: String)
        case full(messege: String)
        case part(of: Double)
    }
    
    init(brand: String, yearOfManufacture: Int, trunk: Trunk = .empty(message: "Пустой"), maxTrunkVolume: Double) {
        self.trunk = trunk
        self.maxTrunkVolume = maxTrunkVolume
        super.init(brand: brand, yearOfManufacture: yearOfManufacture)
    }
    
    override func perform(action: Car.Action) {
        switch action {
        case .switchEngine(let state):
            engine = state
        case .switchWindows(let state):
            windows = state
        case .load(let cargoWeight):
            if maxTrunkVolume < filledTrunkVolume {
                self.trunk = .full(messege: "Перегружен")
                break
            }
            filledTrunkVolume += cargoWeight
            trunk = .part(of: filledTrunkVolume)
        default:
            print("no changes")
            break
        }
    }
    
    func printTrunkState() {
        print(self.trunk)
    }
}

let trunkCar = TrunkCar(brand: "MAN", yearOfManufacture: 1980, maxTrunkVolume: 200)
trunkCar.perform(action: .load(30))
trunkCar.printTrunkState()
trunkCar.perform(action: .load(250))
trunkCar.printTrunkState()
trunkCar.perform(action: .load(10))

let sportCar = SportCar(brand: "Ferrari", yearOfManufacture: 2001, engineVolume: 2.3)
sportCar.perform(action: .load(100))
sportCar.perform(action: .setTurbine(.yes))
sportCar.printEngineVolume()
sportCar.printTurbinState()
