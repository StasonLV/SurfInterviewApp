//
//  CourseViewCell.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import UIKit

class CourseViewCell: UICollectionViewCell {
    
    private let courseLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.backgroundColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1).cgColor
            } else {
                layer.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.961, alpha: 1).cgColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.961, alpha: 1)
        layer.cornerRadius = 12
        
        addSubview(courseLabel)
    }
    
    func configureCell(courseName: String) {
        courseLabel.text = courseName
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            courseLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            courseLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
