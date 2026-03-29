import UIKit

class EnrollButtonCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "EnrollButtonCell"
    
    // MARK: - UI Components
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 20
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        configureShadows()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(priceLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            priceLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    // MARK: - Configuration
    func configure(with price: Double) {
        priceLabel.text = "Enroll - $\(String(format: "%.2f", price))"
    }
    
    // MARK: - Shadows
    private func configureShadows() {
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.layer.shadowRadius = 4
        contentView.layer.masksToBounds = false
    }
}
