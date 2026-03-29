//
//  CourseDetailsCell.swift
//  Elena Logocentr
//
//  Created by Maksim Li on 26/02/2026.
//

import UIKit

class CourseDetailsCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "CourseDetailsCell"
    
    // MARK: - UI Components
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let courseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .systemGray5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        contentView.addSubview(containerView)
        
        containerView.addSubview(courseImageView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(infoLabel)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            courseImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            courseImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            courseImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            courseImageView.heightAnchor.constraint(equalTo: courseImageView.widthAnchor, multiplier: 9/16),
            
            
            descriptionLabel.topAnchor.constraint(equalTo: courseImageView.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            
            infoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            infoLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            infoLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            infoLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
        ])
    }
    
    // MARK: - Configuration
    
    func configure(with course: CourseModel) {
        courseImageView.image = UIImage(named: course.imageName)
        descriptionLabel.text = course.description
        infoLabel.text = "\(course.formattedLessons) (\(course.duration))"
        print("🔍 InfoLabel text: \(infoLabel.text ?? "NIL")")
    }
    
}
