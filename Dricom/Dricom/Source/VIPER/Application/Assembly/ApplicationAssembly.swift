import UIKit

protocol ApplicationAssembly: class {
    func module() -> (rootViewController: UIViewController, applicationLaunchHandler: ApplicationLaunchHandler)
    func applicationModule() -> ApplicationModule?
}
