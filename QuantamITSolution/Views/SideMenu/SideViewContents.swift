//
//  SideViewContents.swift
//  QuantamITSolution
//
//  Created by Chetan Choudhary on 14/05/24.
//

import SwiftUI

struct SideViewContents: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                VStack{
                    SideMenuTopView()
                    Text("Side Menu")
                        .foregroundStyle(Color.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity)
            .background(.gray)
        }
    }
    
    @ViewBuilder
    private func SideMenuTopView() -> some View{
        VStack{
            HStack{
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(Color.white)
                }
                .frame(width: 34, height: 34)
                Spacer()

            }
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .top], 40)
        .padding(.bottom, 30)
    }
}
