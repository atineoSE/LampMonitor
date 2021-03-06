//
//  LazyGridLampRow.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 13/2/21.
//

import SwiftUI

struct LazyGridLampRow: View {
    let lampRecord: LampRecord
    
    private let columns: [GridItem] = [GridItem(), GridItem()]
    
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
        LazyVGrid(columns: columns, alignment: .leading, spacing: 8.0) {
            Text(lampRecord.date.formatted)
                .font(.body)
                .bold()
            Text("New state")
                .font(.body)
                .bold()
            Text(lampRecord.lamp.rawValue)
                .font(.body)
                .bold()
            lampImage
        }
    }
}

struct LazyGridLampRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StackLampRow(lampRecord: TestData.lampOnLampRecord)
            StackLampRow(lampRecord: TestData.lampOffLampRecord)
        }
        .previewLayout(.sizeThatFits)
    }
}
