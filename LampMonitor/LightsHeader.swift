//
//  LightsHeader.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 6/3/21.
//

import SwiftUI

struct LightsHeader: View {
    @Binding var usesLazyStack: Bool
    @Binding var usesLazyGridRow: Bool
    
    var body: some View {
        VStack {
            Toggle(usesLazyStack ? "LazyVStack-based record list" : "List-based record list", isOn: $usesLazyStack)
            Toggle(usesLazyGridRow ? "LazyVGrid-based row" : "VStack/HStack-based row", isOn: $usesLazyGridRow)
        }
        .padding()
        .background(Color.orange)
    }
}

struct LightsHeader_Previews: PreviewProvider {
    static var previews: some View {
        LightsHeader(usesLazyStack: .constant(false), usesLazyGridRow: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
