//
//  CourseViewCell.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import UIKit

final class CourseViewCell: UICollectionViewCell {
    // MARK: - константы
    private enum Constants {
        enum FontConstants {
            static let courseFont: UIFont = .systemFont(ofSize: 14, weight: .medium)
            static let selectedFontColor: UIColor = UIColor(
                red: 1,
                green: 1,
                blue: 1,
                alpha: 1
            )
            static let notSelectedFontColor: UIColor = UIColor(
                red: 0.192,
                green: 0.192,
                blue: 0.192,
                alpha: 1
            )
        }
        enum ViewConstants {
            static let selectedBackColor = UIColor(
                red: 0.192,
                green: 0.192,
                blue: 0.192,
                alpha: 1
            )
            static let notSelectedBackColor = UIColor(
                red: 0.953,
                green: 0.953,
                blue: 0.961,
                alpha: 1
            )
            static let cellCornerRadius: CGFloat = 12
        }
    }

    // MARK: - создание лейбла для ячеек
    private let courseLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Constants.FontConstants.courseFont
        label.textColor = .black
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - проверка стейта
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.backgroundColor = Constants.ViewConstants.selectedBackColor.cgColor
                courseLabel.textColor = Constants.FontConstants.selectedFontColor
            } else {
                layer.backgroundColor = Constants.ViewConstants.notSelectedBackColor.cgColor
                courseLabel.textColor = Constants.FontConstants.notSelectedFontColor
            }
        }
    }

    // MARK: - иниты
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Метод наполнения ячеек датой
    func configureCell(courseName: String) {
        courseLabel.text = courseName
    }

    // MARK: - сетап вью
    private func setupView() {
        backgroundColor = Constants.ViewConstants.notSelectedBackColor
        layer.cornerRadius = Constants.ViewConstants.cellCornerRadius
        addSubview(courseLabel)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            courseLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            courseLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            courseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            courseLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
