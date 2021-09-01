import Foundation

enum NetworkError: Error {
    case serverError(code: Int)
    case timeout
    case jsonDecodeError
    case dataError
    case noConnection
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .serverError(code: let code):
            return "Ошибка сервиса, код ошибки: \(code)"
        case .timeout:
            return "Время ожидания ответа вышло"
        case .jsonDecodeError:
            return "Ошибка декодирования данных"
        case .dataError:
            return "Ошибка данных"
        case .noConnection:
            return "Нет соединения с интернетом или сервисом"
        }
    }
}

struct UserInfo {
    let name: String
    let age: Int
}

class ChatNetwork {
    
    private var userInfo: UserInfo? = UserInfo(name: "Елизавета", age: 23)
    
    private func checkServiceStateWithError() -> Error? {
        let randNum = Int.random(in: 0...10)
        switch randNum {
        case 6:
            return NetworkError.serverError(code: 500)
        case 7:
            return NetworkError.timeout
        case 8:
            return NetworkError.jsonDecodeError
        case 9:
            return NetworkError.dataError
        case 10:
            return NetworkError.noConnection
        default:
            return nil
        }
    }
    
    //MARK: - Задание 1 begin
    func getUserInfo() -> (userInfo: UserInfo?, error: Error?) {
        if let error =  checkServiceStateWithError() {
            return (nil, error)
        }
        return (userInfo, nil)
    }
    
    func setUser(info: UserInfo?) -> Error? {
        if let error =  checkServiceStateWithError() {
            return error
        }
        userInfo = info
        return nil
    }
    //MARK: - Задание 1 end
    
    private func checkServiceState() throws -> Bool {
        let randNum = Int.random(in: 0...10)
        switch randNum {
        case 0...5:
            return true
        case 6:
            throw NetworkError.serverError(code: 500)
        case 7:
            throw NetworkError.timeout
        case 8:
            throw NetworkError.jsonDecodeError
        case 9:
            throw NetworkError.dataError
        case 10:
            throw NetworkError.noConnection
        default:
            return false
        }
    }
    
    //MARK: - Задание 2 begin
    func sendMessage(text: String?) throws -> Bool {
        guard text != nil else {
            throw NetworkError.dataError
        }
        return try checkServiceState()
    }
    
    func getMessages() throws -> [String] {
        try checkServiceState()
        return ["message 1", "message 2",
                "message 3", "message 4",
                "message 5", "message 6",
                "message 7", "message 8",
                "message 9", "message 10"]
    }
    //MARK: - Задание 2 end
}

let network = ChatNetwork()

let getUserInfoData = network.getUserInfo()
if let error = getUserInfoData.error {
    print(error.localizedDescription)
} else if let userInfo = getUserInfoData.userInfo {
    print("Имя пользователя: \(userInfo.name), возраст: \(userInfo.age)")
} else {
    print("Нет данных о пользователе")
}

if let error = network.setUser(info: nil) {
    print(error.localizedDescription)
} else {
    print("Данные пользователя изменены")
}
    
let getUserInfoNewData = network.getUserInfo()
if let error = getUserInfoNewData.error {
    print(error.localizedDescription)
} else if let userInfo = getUserInfoNewData.userInfo {
    print("Имя пользователя: \(userInfo.name), возраст: \(userInfo.age)")
} else {
    print("Нет данных о пользователе")
}

do {
    let isSuccess = try network.sendMessage(text: "")
    print("Сообщение отправлено \(isSuccess ? "успешно" : "безуспешно")")
} catch let error {
    print(error.localizedDescription)
}

do {
    let messages = try network.getMessages()
    print("Доступные сообщения: \(messages.joined(separator: ", "))")
} catch let error {
    print(error.localizedDescription)
}
