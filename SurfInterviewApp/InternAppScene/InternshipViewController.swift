//
//  InternshipViewController.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import UIKit

class InternshipViewController: UIViewController {
    //MARK: Константы
    private enum Constants {
        enum ButtonConstants {
            
        }
        enum FontConstants {
            static let nameLabelText: String = "Стажировка в Surf"
            static let applyLabelText: String = "Хочешь к нам?"
            static let applyLabelFont: UIFont = .systemFont(ofSize: 14, weight: .regular)
            static let nameLabelFont: UIFont = .systemFont(ofSize: 24, weight: .bold)
            static let nameLabelFontColor: UIColor = UIColor(
                red: 0.192,
                green: 0.192,
                blue: 0.192,
                alpha: 1
            )
            static let applyLabelFontColor: UIColor = UIColor(
                red: 0.588,
                green: 0.584,
                blue: 0.608,
                alpha: 1
            )
        }
    }
    
    //MARK: Создание элементов экрана
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
    
    private let applyLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.FontConstants.applyLabelText
        label.font = Constants.FontConstants.applyLabelFont
        label.textColor = Constants.FontConstants.applyLabelFontColor
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var applyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить заявку", for: .normal)
        button.backgroundColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        button.layer.cornerRadius = 32
        button.addTarget(self, action: #selector(presentAlert), for: .touchUpInside)
        return button
    }()

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setDelegates()
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
        view.addSubview(applyLabel)
        view.addSubview(applyButton)
        view.addSubview(collectionView)
        view.addSubview(nameLabel)
        view.bringSubviewToFront(applyButton)
        collectionView.register(
            CourseViewCell.self,
            forCellWithReuseIdentifier: "CourseCell"
        )
        collectionView.register(
            CollectionHeaderView.self,
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
            
            applyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            applyLabel.centerYAnchor.constraint(equalTo: applyButton.centerYAnchor),
            applyLabel.heightAnchor.constraint(equalToConstant: 20),
            
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
