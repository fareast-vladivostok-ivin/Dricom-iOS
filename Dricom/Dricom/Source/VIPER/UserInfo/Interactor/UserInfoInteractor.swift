import Foundation

struct UserInfo {
    let user: User
    var isInFavorites: Bool
}

protocol UserInfoInteractor: class {
    func obtainUserInfo() -> UserInfo
    func changeUserFavoritesStatus(completion: @escaping ApiResult<Void>.Completion)
    func callUser()
    func createChatWithUser(completion: @escaping ApiResult<Channel>.Completion)
}
