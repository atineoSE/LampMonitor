//
//  SimpleLampRow.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 13/2/21.
//

import SwiftUI

struct StackLampRow: View {
    let lampRecord: LampRecord
    
    private var lampImage: some View {
        if lampRecord.isOn {
            return Image(systemName: "lightbulb.fill")
                .foregroundColor(.yellow)
        } else {
            return Image(systemName: "lightbulb")
                .foregroundColor(.primary)
        }
    }
    
    var body: some View {
        VStack(spacing: 8.0) {
            HStack {
                Text(lampRecord.date.formatted)
                    .font(.body)
                    .bold()
                Spacer()
                Text("New state")
                    .font(.body)
                    .bold()
                Spacer()

            }
            HStack {
                Text(lampRecord.lamp.rawValue)
                    .font(.body)
                    .bold()
                Spacer()
                lampImage
                Spacer()
            }
        }
    }
}

struct SimpleLampRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StackLampRow(lampRecord: TestData.lampOnLampRecord)
            StackLampRow(lampRecord: TestData.lampOffLampRecord)
        }
        .previewLayout(.sizeThatFits)
    }
}
