//
//  InternshipVCExtensions.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import UIKit

extension InternshipViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "header",
                for: indexPath
            ) as! CollectionReusableView
            header.configureHeader(title: MockData.shared.pageData[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        MockData.shared.pageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MockData.shared.pageData[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch MockData.shared.pageData[indexPath.section] {
        case .intro(let intro):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "CourseCell",
                for: indexPath
            ) as? CourseViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(courseName: intro[indexPath.row].title)
            return cell
            
        case .conditions(let conditions):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "CourseCell",
                for: indexPath
            ) as? CourseViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(courseName: conditions[indexPath.row].title)
            return cell
        }
    }
}

extension InternshipViewController {
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ in
            let section = MockData.shared.pageData[sectionIndex]
            switch section {
            case .intro(_):
                return self.createIntroSection()
            case .conditions(_):
                return self.createIntroSection()
            }
        }
    }
    
    private func createIntroSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalHeight(1.0)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 15
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}
