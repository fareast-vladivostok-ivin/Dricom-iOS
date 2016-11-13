import Foundation

protocol LoginInteractor: class {
    func login(userName: String, password: String, completion: ApiResult<Void>.Completion)
}