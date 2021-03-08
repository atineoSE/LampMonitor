//
//  LazyGridLampsView.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 13/2/21.
//

import SwiftUI

struct LazyGridLampsView: View {
    let lampRecords: [LampRecord]
    
    private let columns: [GridItem] = [GridItem(), GridItem()]
    
    private func lampImage(for lampRecord: LampRecord) -> some View {
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
            ForEach(lampRecords) { lampRecord in
                Text(lampRecord.date.formatted)
                    .font(.body)
                    .bold()
                Text("New state")
                    .font(.body)
                    .bold()
                Text(lampRecord.lamp.rawValue)
                    .font(.body)
                    .bold()
                lampImage(for: lampRecord)
                Divider().padding([.trailing], -8.0)
                Divider()
            }
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
