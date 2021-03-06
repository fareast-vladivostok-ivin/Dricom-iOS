import UIKit

final class LoginViewController: BaseViewController, LoginViewInput {
    // MARK: - Properties
    private let loginView = LoginView()
    
    // MARK: - View events
    override func loadView() {
        view = loginView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - LoginViewInput
    func setLoginPlaceholder(_ placeholder: String?) {
        loginView.setLoginPlaceholder(placeholder)
    }
    
    func setLoginValue(_ value: String?) {
        loginView.setLoginValue(value)
    }
    
    func setLoginButtonTitle(_ title: String?) {
        loginView.setLoginButtonTitle(title)
    }
    
    func setContactButtonTitle(_ title: String) {
        loginView.setContactButtonTitle(title)
    }
    
    func setPasswordPlaceholder(_ placeholder: String?) {
        loginView.setPasswordPlaceholder(placeholder)
    }
    
    func setRegisterButtonTitle(_ title: String) {
        loginView.setRegisterButtonTitle(title)
    }
    
    var onLoginChange: ((String?) -> ())? {
        get { return loginView.onLoginChange }
        set { loginView.onLoginChange = newValue }
    }
    
    var onPasswordChange: ((String?) -> ())? {
        get { return loginView.onPasswordChange }
        set { loginView.onPasswordChange = newValue }
    }
    
    var onLoginButtonTap: (() -> ())? {
        get { return loginView.onLoginButtonTap }
        set { loginView.onLoginButtonTap = newValue }
    }
    
    var onRegisterButtonTap: (() -> ())? {
        get { return loginView.onRegisterButtonTap }
        set { loginView.onRegisterButtonTap = newValue }
    }
    
    var onContactButtonTap: (() -> ())? {
        get { return loginView.onContactButtonTap }
        set { loginView.onContactButtonTap = newValue }
    }
    
    func focusOnLoginField() {
        loginView.focusOnLoginField()
    }
    
    func focusOnPasswordField() {
        loginView.focusOnPasswordField()
    }
    
    func setLoginFieldState(_ state: InputFieldViewState) {
        loginView.setLoginFieldState(state)
    }
    
    func setPasswordFieldState(_ state: InputFieldViewState) {
        loginView.setPasswordFieldState(state)
    }
    
    func endEditing() {
        loginView.endEditing(true)
    }
    
    // MARK: ActivityDisplayable
    func startActivity() {
        loginView.startActivity()
    }
    
    func stopActivity() {
        loginView.stopActivity()
    }
}
