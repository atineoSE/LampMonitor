//
//  LightsHeader.swift
//  LampMonitor
//
//  Created by Adrian Tineo Cabello on 6/3/21.
//

import SwiftUI

struct LightsHeader: View {
    @Binding var usesLazyGrid: Bool
    
    var body: some View {
        VStack {
            Toggle(usesLazyGrid ? "LazyVGrid-based record list" : "LazyVStack-based record list", isOn: $usesLazyGrid)
        }
        .padding()
        .background(Color.orange)
    }
}

struct LightsHeader_Previews: PreviewProvider {
    static var previews: some View {
        LightsHeader(usesLazyGrid: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
