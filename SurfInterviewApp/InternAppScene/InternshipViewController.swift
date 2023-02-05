//
//  InternshipViewController.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import UIKit

class InternshipViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var applyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить заявку", for: .normal)
        button.backgroundColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        button.layer.cornerRadius = 32
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setDelegates()
        view.backgroundColor = .white
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupUI() {
        view.addSubview(applyButton)
        view.addSubview(collectionView)
        view.bringSubviewToFront(applyButton)
        collectionView.register(
            CourseViewCell.self,
            forCellWithReuseIdentifier: "CourseCell"
        )
        collectionView.register(
            CollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header"
        )
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.collectionViewLayout = createLayout()
        
        NSLayoutConstraint.activate([
            applyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58),
            applyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyButton.widthAnchor.constraint(equalToConstant: 219),
            applyButton.heightAnchor.constraint(equalToConstant: 60),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
