final class ViewDebugServiceFactory: ServiceFactory {
    func registrationService() -> RegistrationService {
        return ViewDebugRegistrationService()
    }
    
    func authorizationService() -> AuthorizationService {
        return ViewDebugAuthorizationServiceImpl()
    }
    
    func mailComposeDelegateService() -> MailComposeDelegateService {
        return MailComposeDelegateServiceImpl()
    }
}
