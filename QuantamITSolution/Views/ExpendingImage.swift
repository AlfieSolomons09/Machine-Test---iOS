//
//  ExpendingImage.swift
//  QuantamITSolution
//
//  Created by Chetan Choudhary on 14/05/24.
//

import SwiftUI
import URLImage

struct ExpandingImage: View {
    let url: URL
        @Binding var isExpanded: Bool
        
        var body: some View {
            URLImage(url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.black)
                    .edgesIgnoringSafeArea(.all)
                    .scaleEffect(isExpanded ? 1.0 : 0.5)
                    .animation(.easeIn, value: 0.5)
            }
        }
}
