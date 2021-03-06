//
//  LampMonitorApp.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 13/2/21.
//

import SwiftUI

@main
struct LampMonitorApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LampRecordsView(usesLazyStack: false, usesLazyGridRow: false)
            }
        }
    }
}
