//
//  ImageViewController.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import UIKit

final class ImageViewController: UIViewController {
    //MARK: Установка цвета статусбара
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .darkContent
    }

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(imageName: "background.jpeg")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        prepareMainVC()
    }

    //MARK: Метод настройки отоборажения вьюконтроллера с информацией
    private func prepareMainVC() {
        let myVC = InternshipViewController()
        if let sheet = myVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 30
        }
        self.present(myVC, animated: false, completion: nil)
        myVC.isModalInPresentation = true
    }
}

//MARK: Экстеншн для фоновой картинки
extension ImageViewController {
    private func setBackgroundImage(imageName: String) {
        let backgroundImage = UIImage(named: imageName)
        let backgroundImageView = UIImageView(frame: self.view.frame)
        backgroundImageView.image = backgroundImage
        self.view.insertSubview(backgroundImageView, at: 0)
    }
}
