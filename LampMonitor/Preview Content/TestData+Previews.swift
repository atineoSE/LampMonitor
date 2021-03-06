//
//  TestData+Previews.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 13/2/21.
//

import Foundation

extension TestData {
    static let lampOnLampRecord = LampRecord(id: 0, date: Date(), isOn: true, lamp: .kitchen)
    static let lampOffLampRecord = LampRecord(id: 1, date: Date().addingTimeInterval(120.0), isOn: false, lamp: .livingRoom)
}
