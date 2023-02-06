//
//  CollectionReusableView.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import UIKit

final class CollectionHeaderView: UICollectionReusableView {
    // MARK: - константы
    private enum Constants {
        enum FontConstants {
            static let headerFont: UIFont = .systemFont(ofSize: 16, weight: .regular)
            static let headerFontColor: UIColor = UIColor(
                red: 0.588,
                green: 0.584,
                blue: 0.608,
                alpha: 1
            )
        }
    }

    // MARK: - Создание лейбла хэдэра
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.sizeToFit()
        label.textColor = Constants.FontConstants.headerFontColor
        label.font = Constants.FontConstants.headerFont
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - иниты
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - метод наполнения хэдэра датой
    func configureHeader(title: String) {
        headerLabel.text = title
    }

    // MARK: - установка констрейнтов
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
