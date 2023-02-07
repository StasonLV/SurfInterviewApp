//
//  SubscribeAlert.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 06.02.2023.
//

import UIKit

enum AppAlerts {
    static let applicationAlert: UIAlertController = {
        let alert = UIAlertController(
            title: "Поздравляем!",
            message: "Ваша заявка успешно отправлена!",
            preferredStyle: .alert
        )
        let actionClose = UIAlertAction(title: "Закрыть", style: .default)
        alert.addAction(actionClose)
        return alert
    }()
}
//сделал енамом на случай, если нужно будет добавить еще алертов
