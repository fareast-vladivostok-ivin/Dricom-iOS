struct RegistrationData {
    var avatarImageId: String?
    var name: String
    var email: String
    var phone: String
    var license: String
    var password: String
    let token: String?
}

protocol RegistrationService {
    func register(with data: RegistrationData, completion: @escaping ApiResult<User>.Completion)
}

final class RegistrationServiceImpl: RegistrationService {
    // MARK: - Dependencies
    private let networkClient: NetworkClient
    
    // MARK: - Init
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    // MARK: - RegistrationService
    func register(with data: RegistrationData, completion: @escaping ApiResult<User>.Completion) {
        let request = RegisterRequest(
            email: data.email,
            name: data.name,
            license: data.license,
            phone: data.phone,
            password: data.password,
            token: nil  // TODO: send push token if exists
        )
        
        networkClient.send(request: request) { result in
            result.onData { [weak self] loginResponse in
                self?.networkClient.jwt = loginResponse.jwt
                completion(.data(loginResponse.user))
            }
            result.onError { networkRequestError in
                completion(.error(networkRequestError))
            }
        }
    }
}