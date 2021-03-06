//
//  Date.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 13/2/21.
//

import Foundation

extension Date {
    var formatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM (HH:mm)"
        return dateFormatter.string(from: self)
    }
}
