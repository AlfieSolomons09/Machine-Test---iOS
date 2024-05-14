//
//  ContentView.swift
//  QuantamITSolution
//
//  Created by Chetan Choudhary on 14/05/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    var body: some View {
        TabView{
            HomeView()
                .tabItem() {
                    Image(systemName: "house")
                        .bold()
                        .foregroundStyle(Color.black)
                }
            
            GYMView()
                .tabItem() {
                    Image(systemName: "dumbbell")
                        .bold()
                        .foregroundStyle(Color.black)
                }
            
            StatsView()
                .tabItem() {
                    Image(systemName: "chart.bar.xaxis")
                        .bold()
                        .foregroundStyle(Color.black)
                }
            
            Location()
                .tabItem() {
                    Image(systemName: "mappin.square")
                        .resizable()
                        .bold()
                        .foregroundStyle(Color.black)
                }
        }
        .onAppear{
            viewModel.fetchData()
        }
    }
}



#Preview {
    ContentView()
}
