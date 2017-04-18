import UIKit
import AlamofireImage

final class UserInfoView: UIView, StandardPreloaderViewHolder, ActivityDisplayable {
    // MARK: Properties
    private let nameLabel = UILabel()
    private let avatarImageView = UIImageView(image: #imageLiteral(resourceName: "Avatar"))
    private let licenceView = LicensePlateView()
    
    let preloader = StandardPreloaderView(style: .dark)
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        
        addSubview(nameLabel)
        addSubview(avatarImageView)
        addSubview(licenceView)
        
        addSubview(preloader)
        
        setUpStyle()
        
        // TODO: Replace with close button
        let closeGesture = UITapGestureRecognizer(target: self, action: #selector(handleClose(_:)))
        addGestureRecognizer(closeGesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpStyle() {
        backgroundColor = UIColor.drcWhite
        
        avatarImageView.size = SpecSizes.avatarImageSize
        avatarImageView.layer.cornerRadius = avatarImageView.size.height/2
        avatarImageView.layer.masksToBounds = true
        
        nameLabel.font = UIFont.drcUserNameFont()
        nameLabel.textColor = UIColor.drcSlate
        nameLabel.textAlignment = .center
    }
    
    // MARK: - Layout
    // MARK: Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.sizeToFit()
        nameLabel.layout(left: bounds.left, right: bounds.right, top: 45, height: nameLabel.height)
        
        avatarImageView.top = nameLabel.bottom + SpecMargins.innerContentMargin
        avatarImageView.centerX = bounds.centerX
        
        licenceView.size = licenceView.sizeThatFits()
        licenceView.top = avatarImageView.bottom + SpecMargins.contentMargin
        licenceView.centerX = bounds.centerX
        
        preloader.frame = bounds
    }
    
    // MARK: - Public
    func setName(_ name: String?) {
        nameLabel.text = name
        setNeedsLayout()
    }
    
    func setAvatarImageUrl(_ avatarImageUrl: URL?) {
        guard let avatarImageUrl = avatarImageUrl else {
            avatarImageView.image = #imageLiteral(resourceName: "Avatar")
            return
        }
        
        let imageFilter = AspectScaledToFillSizeWithRoundedCornersFilter(
            size: avatarImageView.size,
            radius: avatarImageView.size.width/2
        )
        
        avatarImageView.af_setImage(
            withURL: avatarImageUrl,
            placeholderImage: nil,
            filter: imageFilter,
            imageTransition: .crossDissolve(0.3)
        )
    }
    
    func setLicenseParts(_ licenseParts: LicenseParts) {
        licenceView.setLicenseParts(licenseParts)
    }
    
    func setFavoritesButtonTitle(_ title: String) {
        
    }
    
    var onFavoritesButtonTap: (() -> ())?
    
    func setUserConnectionHint(_ hint: String) {
        
    }
    
    func setCallButtonTitle(_ title: String) {
        
    }
    
    var onCallButtonTap: (() -> ())?
    
    func setMessageButtonTitle(_ title: String) {
        
    }
    
    var onMessageButtonTap: (() -> ())?
    
    var onCloseTap: (() -> ())?
    @objc private func handleClose(_ sender: UIGestureRecognizer) {
        switch sender.state {
        case .ended:
            onCloseTap?()
        default:
            break
        }
    }
}
