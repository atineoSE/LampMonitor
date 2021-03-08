//
//  LampRecordsView.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 15/2/21.
//

import SwiftUI

struct LampRecordsView: View {
    let lampRecords: [LampRecord] = TestData.getSampleLampRecords()
    
    @State var usesLazyGrid: Bool
    
    var body: some View {
        VStack {
            LightsHeader(usesLazyGrid: $usesLazyGrid)
            ScrollView {
                Group {
                    if usesLazyGrid {
                        LazyGridLampsView(lampRecords: lampRecords)
                    } else {
                        LazyVStack {
                            ForEach(lampRecords) { lampRecord in
                                StackLampRow(lampRecord: lampRecord)
                                Divider()
                            }
                        }
                    }
                }
                .padding([.leading, .trailing])
            }
        }
        .navigationTitle("Lamp records")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LampRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LampRecordsView(usesLazyGrid: false)
            LampRecordsView(usesLazyGrid: true)
        }
        .previewLayout(.sizeThatFits)
    }
}
