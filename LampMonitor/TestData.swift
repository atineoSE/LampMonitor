//
//  TestData.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 13/2/21.
//

import Foundation

struct TestData {
    private static let numberOfRecords = 50
    static var highlightedRecord =  numberOfRecords / 2
    
    private static var currentDate: Date = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateFormatter.date(from: "01.01.2021 00:00:00")!
    }()
    
    private static var nextDate: Date {
        // random time between 2 minutes and 12 hours from previous time
        currentDate.addTimeInterval(Double.random(in: 2*60..<12*60*60))
        return currentDate
    }
    
    private static var nextLamp: Lamp {
        Lamp.allCases.randomElement()!
    }
    
    static func getSampleLampRecords() -> [LampRecord] {
        var lampsOnState: [Lamp:Bool] = [
            .kitchen: false,
            .bathroom: false,
            .hall: false,
            .livingRoom: false
        ]
        var lampRecords: [LampRecord] = []
        
        for index in 0..<numberOfRecords {
            let lamp = nextLamp
            lampsOnState[lamp]!.toggle()
            let isOn = lampsOnState[lamp]!
            lampRecords.append(LampRecord(id: index, date: nextDate, isOn: isOn, lamp: lamp))
        }
        
        return lampRecords
    }
}

