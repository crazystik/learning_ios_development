import Foundation

enum Engine: String {
    case on
    case off
}

enum Windows: String {
    case open
    case close
}
    
enum Action {
    case switchEngine(Engine)
    case switchWindows(Windows)
    case load(Double)
}

struct SportCar {
    let brand: String
    let yearOfManufacture: Int
    var engine: Engine
    var windows: Windows
    
    mutating func action(_ action: Action) {
        switch action {
        case .switchEngine(let engine):
            self.engine = engine
        case .switchWindows(let windows):
            self.windows = windows
        case .load(_):
            print("В спорт кар нельзя загружать грузы")
        }
    }
}

struct TrunkCar {
    let brand: String
    let yearOfManufacture: Int
    let maxTrunkVolume: Double
    var trunkValue: Double
    var engine: Engine
    var windows: Windows
    
    mutating func action(_ action: Action) {
        switch action {
        case .switchEngine(let engine):
            self.engine = engine
        case .switchWindows(let windows):
            self.windows = windows
        case .load(let trunk):
            if maxTrunkVolume >= trunk {
                trunkValue = trunk
            } else {
                print("Груз слишком большой! Не возможно загрузить.")
            }
        }
    }
}

var sportCar = SportCar(brand: "Honda", yearOfManufacture: 2018, engine: .off, windows: .open)
print(sportCar)
sportCar.action(.switchEngine(.on))
print(sportCar)
sportCar.action(.switchWindows(.close))
print(sportCar)
sportCar.action(.load(100))
print(sportCar)

var trunkCar = TrunkCar(brand: "КАМАЗ", yearOfManufacture: 2010, maxTrunkVolume: 1000, trunkValue: 0, engine: .on, windows: .close)
print(trunkCar)
trunkCar.action(.switchEngine(.off))
print(trunkCar)
trunkCar.action(.switchWindows(.open))
print(trunkCar)
trunkCar.action(.load(100))
print(trunkCar)
trunkCar.action(.load(2000))
print(trunkCar)

