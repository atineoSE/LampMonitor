//
//  LampRecordsView.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 15/2/21.
//

import SwiftUI

struct LampRecordsView: View {
    let lampRecords: [LampRecord] = TestData.getSampleLampRecords()
    
    @State var usesLazyStack: Bool
    @State var usesLazyGridRow: Bool
    
    private func records(showsDivider: Bool) -> some View {
        ForEach(lampRecords) { lampRecord in
            Group {
                if usesLazyGridRow {
                    LazyGridLampRow(lampRecord: lampRecord)
                } else {
                    StackLampRow(lampRecord: lampRecord)
                }
            }
            .background(lampRecord.isHighlighted ? Color.orange : Color(UIColor.systemBackground))
            if showsDivider {
                Divider()
            }
        }
    }
    
    var body: some View {
        VStack {
            LightsHeader(usesLazyStack: $usesLazyStack, usesLazyGridRow: $usesLazyGridRow)
            if usesLazyStack {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        records(showsDivider: true)
                    }
                    .padding([.leading, .trailing])
                }
            } else {
                List {
                    records(showsDivider: false)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Lamp records")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LampRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LampRecordsView(usesLazyStack: true, usesLazyGridRow: false)
            LampRecordsView(usesLazyStack: false, usesLazyGridRow: false)
        }
            .previewLayout(.sizeThatFits)
    }
}
