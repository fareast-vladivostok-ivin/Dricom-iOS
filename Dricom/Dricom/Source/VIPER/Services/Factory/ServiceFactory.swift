protocol ServiceFactory {
    // MARK: - Data services
    func authorizationService() -> AuthorizationService
    func registrationService() -> RegistrationService
}
