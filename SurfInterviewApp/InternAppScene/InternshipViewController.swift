//
//  InternshipViewController.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import UIKit

final class InternshipViewController: UIViewController {
    //MARK: Константы
    private enum Constants {
        enum FontConstants {
            static let nameLabelText: String = "Стажировка в Surf"
            static let nameLabelFont: UIFont = .systemFont(ofSize: 24, weight: .bold)
            static let nameLabelFontColor: UIColor = UIColor(
                red: 0.192,
                green: 0.192,
                blue: 0.192,
                alpha: 1
            )
        }
    }
    
    //MARK: Создание элементов экрана
    private let buttonView = ButtonContainerView(frame: .zero)
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.FontConstants.nameLabelText
        label.font = Constants.FontConstants.nameLabelFont
        label.textColor = Constants.FontConstants.nameLabelFontColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setDelegates()
    }
    
    override func viewWillLayoutSubviews() {
        view.bringSubviewToFront(buttonView)
    }

    //MARK: Приватные методы класса. Настройка юай и делегатов.
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @objc private func presentAlert() {
        self.present(AppAlerts.applicationAlert, animated: true)
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(buttonView)
        view.addSubview(collectionView)
        view.addSubview(nameLabel)
        buttonView.addApplyButtonTarget(self, action: #selector(presentAlert))
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            CourseViewCell.self,
            forCellWithReuseIdentifier: "CourseCell"
        )
        collectionView.register(
            CollectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header"
        )
        collectionView.collectionViewLayout = createLayout()

        NSLayoutConstraint.activate([
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 120),
                        
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            nameLabel.heightAnchor.constraint(equalToConstant: 32),

            collectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
