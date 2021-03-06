import Foundation
import JSQMessagesViewController

final class ChatPresenter {
    // MARK: - Private properties
    private let interactor: ChatInteractor
    private let router: ChatRouter
    
    // MARK: - Init
    init(interactor: ChatInteractor,
         router: ChatRouter)
    {
        self.interactor = interactor
        self.router = router
        
        setUpInteractor()
    }
    
    // MARK: - Weak properties
    weak var view: ChatViewInput? {
        didSet {
            setUpView()
        }
    }
    
    // MARK: - Private
    private func setUpInteractor() {
        interactor.onReceiveMessages = { [weak self] messageList in
            self?.view?.setMessages(
                messageList.map { $0.toJSQMessage() }
            )
        }
    }
    
    private func setUpView() {
        view?.onViewDidLoad = { [weak self] in
            self?.fetchAndPresentData()
            self?.interactor.startMessagesPolling()
        }
        
        view?.onTapSendButton = { [weak self] text in
            self?.interactor.send(text) { result in
                self?.processMessagesListResult(result)
            }
        }
        
        view?.onCloseTap = { [weak self] in
            self?.dismissModule()
        }
    }
    
    private func fetchAndPresentData() {
        let channel = interactor.obtainChannel()
        view?.setChannelInfo(
            ChannelInfo(
                collocutorName: channel.collocutor.name ?? "",
                ownerId: channel.user.id,
                ownerName: channel.user.name ?? ""
            )
        )
        
        interactor.fetchMessages { [weak self] result in
            self?.processMessagesListResult(result)
        }
    }
    
    private func processMessagesListResult(_ result: ApiResult<[TextMessage]>) {
        result.onData { [weak self] messageList in
            self?.view?.setMessages(
                messageList.map { $0.toJSQMessage() }
            )
        }
        result.onError { [weak self] networkRequestError in
            self?.view?.showError(networkRequestError)
        }
    }
    
    // MARK: - ChatModule
    func focusOnModule() {
        router.focusOnCurrentModule()
    }
    
    func dismissModule() {
        router.dismissCurrentModule()
    }
}
