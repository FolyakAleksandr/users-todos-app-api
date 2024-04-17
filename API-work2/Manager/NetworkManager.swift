import Alamofire
import UIKit

class NetworkManager {
    static let instance = NetworkManager()

    private init() {}

    enum BeginURL {
        static let jsonPlaceholder = "https://jsonplaceholder.typicode.com"
    }

    enum EndURL {
        static let users = "/users"
        static let todos = "/todos"
    }

    func getUsers(completion: @escaping (([User]) -> ())) {
        AF.request(BeginURL.jsonPlaceholder + EndURL.users).responseDecodable(of: [User].self) { responde in
            switch responde.result {
            case .success(let user): completion(user)
            case .failure(let failure): print(failure)
            }
        }
    }

    func getTodos(completion: @escaping (([Todo]) -> ())) {
        AF.request(BeginURL.jsonPlaceholder + EndURL.todos).responseDecodable(of: [Todo].self) { responde in
            switch responde.result {
            case .success(let todo): completion(todo)
            case .failure(let failure): print(failure)
            }
        }
    }
}
