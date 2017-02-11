protocol DisposeBag {
    func addDisposable(_: AnyObject)
}

// Default `DisposeBag` implementation
extension DisposeBag where Self: DisposeBagHolder {
    func addDisposable(_ anyObject: AnyObject) {
        disposeBag.addDisposable(anyObject)
    }
}

// Non thread safe `DisposeBag` implementation
final class DisposeBagImpl: DisposeBag {
    private var disposables: [AnyObject] = []
    
    func addDisposable(_ anyObject: AnyObject) {
        disposables.append(anyObject)
    }
}
