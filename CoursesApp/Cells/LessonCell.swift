//
//  LessonCell.swift
//  Elena Logocentr
//
//  Created by Maksim Li on 21/02/2026.
//

import UIKit

class LessonCell: UICollectionViewCell {
    
    // MARK: - Identifier
    static let identifier = "LessonCell"
    
    // MARK: - UI Components
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, durationLabel])
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        imageView.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        imageView.tintColor = .systemGreen
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statusIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: - Init
    override init (frame: CGRect) {
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
        containerView.addSubview(labelsStackView)
        containerView.addSubview(checkmarkImageView)
        containerView.addSubview(statusIndicatorView)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            labelsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            labelsStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: checkmarkImageView.leadingAnchor, constant: -12),
            
            checkmarkImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            checkmarkImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 24),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 24),
            
            statusIndicatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            statusIndicatorView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            statusIndicatorView.widthAnchor.constraint(equalToConstant: 24),
            statusIndicatorView.heightAnchor.constraint(equalToConstant: 24)
            
        ])
    }
    
    private func configureShadows() {
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.layer.shadowRadius = 4
        contentView.layer.masksToBounds = false
        
    }
    
    
    // MARK: - Configuration
    func configure(with lesson: Lesson) {
        
        titleLabel.text = lesson.title
        durationLabel.text = lesson.duration
        
        switch lesson.status {
            
        case .locked:
            titleLabel.textColor = .systemGray
            durationLabel.textColor = .systemGray2
            
            checkmarkImageView.isHidden = true
            statusIndicatorView.isHidden = false
            statusIndicatorView.layer.borderColor = UIColor.systemGray4.cgColor
            
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor.systemGray5.cgColor
            
        case .available:
            titleLabel.textColor = .label
            durationLabel.textColor = .systemGray
            
            checkmarkImageView.isHidden = true
            statusIndicatorView.isHidden = false
            statusIndicatorView.layer.borderColor = UIColor.systemBlue.cgColor
            
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.3).cgColor
            
        case .completed:
            titleLabel.textColor = .label
            durationLabel.textColor = .systemGray
            
            checkmarkImageView.isHidden = false
            statusIndicatorView.isHidden = true
            
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor.systemGreen.withAlphaComponent(0.3).cgColor
            
        }
        
    }
}
