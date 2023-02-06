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
        .conditions([.init(title: "Android"),
                .init(title: "Design"),
                .init(title: "QA"),
                .init(title: "iOS"),
                .init(title: "Flutter"),
                .init(title: "PM")])
    }()

    var pageData: [SectionData] {
        [intro, conditions]
    }
}
