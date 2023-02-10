//
//  ButtonContainerView.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 10.02.2023.
//

import UIKit

final class ButtonContainerView: UIView {
    //MARK: Константы
    private enum Constants {
        enum ButtonConstants {
            static let title: String = "Отправить заявку"
            static let cornerRad: CGFloat = 32
            static let color: UIColor = UIColor(
                red: 0.192,
                green: 0.192,
                blue: 0.192,
                alpha: 1
            )
        }
        enum FontConstants {
            static let applyLabelText: String = "Хочешь к нам?"
            static let applyLabelFont: UIFont = .systemFont(ofSize: 14, weight: .regular)
            static let applyLabelFontColor: UIColor = UIColor(
                red: 0.588,
                green: 0.584,
                blue: 0.608,
                alpha: 1
            )
        }
    }

    //MARK: Создание элементов вью
    private let stackForButtons: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.backgroundColor = .white
        stack.sizeToFit()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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

    private let applyButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.ButtonConstants.title, for: .normal)
        button.backgroundColor = Constants.ButtonConstants.color
        button.layer.cornerRadius = Constants.ButtonConstants.cornerRad
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - иниты
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - метод добавления таргета кнопке "Отправить заявку"
    func addApplyButtonTarget(_ target: Any?, action: Selector) {
        applyButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    // MARK: - сетап вью
    private func setupView() {
        addSubview(stackForButtons)
        stackForButtons.addArrangedSubview(applyLabel)
        stackForButtons.addArrangedSubview(applyButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            applyButton.widthAnchor.constraint(equalToConstant: 219),
            applyButton.heightAnchor.constraint(equalToConstant: 60),
            
            applyLabel.heightAnchor.constraint(equalToConstant: 20),
            
            stackForButtons.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackForButtons.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}
