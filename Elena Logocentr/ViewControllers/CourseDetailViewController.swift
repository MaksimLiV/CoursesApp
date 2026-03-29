//
//  CourseDetailViewController.swift
//  Elena Logocentr
//
//  Created by Maksim Li on 11/02/2026.
//

import UIKit

class CourseDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let course: CourseModel
    
    private var lessons: [Lesson] {
        return course.lessonsList
    }
    
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Init
    
    init(course: CourseModel) {
        self.course = course
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CourseDetailsCell.self, forCellWithReuseIdentifier: CourseDetailsCell.identifier)
        collectionView.register(LessonCell.self, forCellWithReuseIdentifier: LessonCell.identifier)
        collectionView.register(EnrollButtonCell.self, forCellWithReuseIdentifier: EnrollButtonCell.identifier)
        
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = course.title
        
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Layout
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return layout
    }
}

// MARK: - UICollectionViewDataSource

extension CourseDetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return lessons.count
        case 2:
            return course.isPurchased ? 0 : 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CourseDetailsCell.identifier,
                for: indexPath
            ) as? CourseDetailsCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: course)
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LessonCell.identifier,
                for: indexPath
            ) as? LessonCell else {
                return UICollectionViewCell()
            }
            
            let lesson = lessons[indexPath.item]
            cell.configure(with: lesson)
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: EnrollButtonCell.identifier,
                for: indexPath
            ) as? EnrollButtonCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: course.price)
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension CourseDetailViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CourseDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width - 32
        
        switch indexPath.section {
        case 0:
            return CGSize(width: width, height: 350)
            
        case 1:
            return CGSize(width: width, height: 70)
            
        case 2:
            return CGSize(width: width, height: 56)
            
        default:
            return .zero
        }
    }
}
