//
//  Model.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 13/2/21.
//

import Foundation

enum Lamp: String, CaseIterable {
    case bathroom = "Bathroom"
    case hall = "Hall"
    case kitchen = "Kitchen"
    case livingRoom = "Living room"
}

struct LampRecord: Identifiable {
    let id: Int
    let date: Date
    let isOn: Bool
    let lamp: Lamp
}

extension LampRecord {
    var isHighlighted: Bool {
        id == TestData.highlightedRecord
    }
}
