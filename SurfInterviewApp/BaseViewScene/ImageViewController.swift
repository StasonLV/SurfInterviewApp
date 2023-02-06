//
//  ImageViewController.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import UIKit

class ImageViewController: UIViewController {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage(imageName: "background.jpeg")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        prepareMainVC()
    }
    
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

extension ImageViewController {
    private func setBackgroundImage(imageName: String) {
        let backgroundImage = UIImage(named: imageName)
        let backgroundImageView = UIImageView(frame: self.view.frame)
        backgroundImageView.image = backgroundImage
        self.view.insertSubview(backgroundImageView, at: 0)
    }
}
