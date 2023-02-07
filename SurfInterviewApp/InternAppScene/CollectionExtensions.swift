//
//  InternshipVCExtensions.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import UIKit

extension InternshipViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - метод для селекта и деселекта ячеек
    func collectionView(
        _ collectionView: UICollectionView,
        shouldSelectItemAt indexPath: IndexPath
    ) -> Bool {
        let item = collectionView.cellForItem(at: indexPath)
            if item?.isSelected ?? false {
                collectionView.deselectItem(at: indexPath, animated: true)
            } else {
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
                DispatchQueue.main.async {
                    collectionView.moveItem(at: indexPath, to: IndexPath(item: 0, section: indexPath.section))
                }
                return true
            }
            return false
        }
    
    // MARK: - метод настройки хедера секций
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "header",
                for: indexPath
            ) as! CollectionHeaderView
            header.configureHeader(title: MockData.shared.pageData[indexPath.section].title)
            header.sizeToFit()
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    // MARK: - методы настройки коллекции в зависимости от датасорса
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        MockData.shared.pageData.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MockData.shared.pageData[section].count
    }
    
    // MARK: - настройка ячеек колекции
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
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
            cell.sizeToFit()
            return cell
        }
    }
}
//Несмотря на то что ячейки использую одинаковые, оставил перебор по кейсам на случай, если нужно будет переделать под разные.

// MARK: - настройка лейаутов секций
extension InternshipViewController {
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ in
            let section = MockData.shared.pageData[sectionIndex]
            switch section {
            case .intro(_):
                return self.createIntroSection()
            case .conditions(_):
                return self.createConditionsSection()
            }
        }
    }

    // MARK: - метод лейаута для первой секции
    private func createIntroSection() -> NSCollectionLayoutSection {

        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .estimated(200),
                heightDimension: .estimated(44)
            )
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
            widthDimension: .absolute(700),
            heightDimension: .estimated(44)
        ),
            subitems: [item]
        )
        group.interItemSpacing = .fixed(12)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 24, trailing: 0)
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        return section
    }

    // MARK: - метод лейаута для второй секции
    private func createConditionsSection() -> NSCollectionLayoutSection {

        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .estimated(80),
                heightDimension: .estimated(44)
            )
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.2),
                heightDimension: .absolute(100)
        ),
            subitems: [item]
        )
        group.interItemSpacing = .flexible(5)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 5
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 24, trailing: 25)
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        return section
    }

    // MARK: - метод создания хэдэра
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(80)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top
        )
    }
}
