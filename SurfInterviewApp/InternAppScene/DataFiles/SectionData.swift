//
//  SectionData.swift
//  SurfInterviewApp
//
//  Created by Stanislav Lezovsky on 05.02.2023.
//

import Foundation

enum SectionData {
    case intro([ItemData])
    case conditions([ItemData])

    var items: [ItemData] {
        switch self {
        case .intro(let items),
                .conditions(let items):
            return items
        }
    }

    var count: Int {
        items.count
    }

    var title: String {
        switch self {
        case .intro(_):
            return "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
        case .conditions(_):
            return "Получай стипендию, выстраивай удобный график, работай на современном железе."
        }
    }
}
