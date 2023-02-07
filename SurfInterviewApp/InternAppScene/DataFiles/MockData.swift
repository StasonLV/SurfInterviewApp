//
//  MockData.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import Foundation

struct MockData {
    static let shared = MockData()

    private let intro: SectionData = {
        .intro([.init(title: "Android"),
                .init(title: "iOS"),
                .init(title: "QA"),
                .init(title: "Design"),
                .init(title: "Flutter"),
                .init(title: "PM")])
    }()

    private let conditions: SectionData = {
        .conditions([.init(title: "Flutter"),
                .init(title: "Design"),
                .init(title: "Android"),
                .init(title: "iOS"),
                .init(title: "Flutter"),
                .init(title: "Web2"),
                .init(title: "QA"),
                .init(title: "Web3"),
                .init(title: "Flutter"),
                .init(title: "Web4"),
                .init(title: "DevOps"),
                .init(title: "Аналитика"),
                .init(title: "PM")])
    }()

    var pageData: [SectionData] {
        [intro, conditions]
    }
}
