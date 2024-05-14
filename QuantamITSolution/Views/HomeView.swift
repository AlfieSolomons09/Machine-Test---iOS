//
//  ContentView.swift
//  QuantamITSolution
//
//  Created by Chetan Choudhary on 14/05/24.
//

import SwiftUI
import CoreData
import URLImage

struct HomeView: View {
    @State var waterfallImage = false
    @State var photograph = false
    @State var presentSideMenu = false
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white.ignoresSafeArea(.all)
                
                VStack{
                    header
                    
                    images
                        .padding(.vertical)
                    
                    ScrollView{
                        elements
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .top){
                    ZStack{
                        HStack{
                            Button{
                                presentSideMenu.toggle()
                            } label: {
                                Image("Menu")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            .frame(width: 44, height: 44)
                            .padding(.leading, 10)
                            
                            Spacer()
                            HStack(spacing: 22){
                                
                                NavigationLink(destination: NotificationView()) {
                                    Image(systemName: "bell.and.waves.left.and.right.fill")
                                        .foregroundStyle(Color.black)
                                        .frame(width: 34, height: 34)
                                }
                                
                                
                                NavigationLink(destination: CoachView()){
                                    Text("COACH")
                                        .bold()
                                        .foregroundStyle(Color.black)
                                        .frame(width: 64, height: 34)
                                }
                            }
                            .padding(.trailing)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .zIndex(1)
                    .shadow(radius: 0.5)
                }
                .background(Color.white.opacity(0.8))
                
                SideMenu()
            }
            .frame(maxWidth: .infinity)
            .onAppear{
                viewModel.fetchData()
            }
            
        }
        .overlay{
            if waterfallImage == true {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture {
                        waterfallImage.toggle()
                    }
                
                Image("waterfall")
                    .resizable()
                    .frame(width: 300, height: 300)
            }
            
            if photograph == true {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture {
                        photograph.toggle()
                    }
                
                Image("DemoImage")
                    .resizable()
                    .frame(width: 300, height: 300)
            }
        }
    }
    
    @ViewBuilder
    private func SideMenu() -> some View{
        SideMenuView(isShowing: $presentSideMenu, direction: .leading) {
            SideViewContents(presentSideMenu: $presentSideMenu)
                .frame(width: 300)
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView{
    var header: some View{
        ZStack{
            Image("DemoImage")
                .resizable()
                .frame(height: 250)
                .padding(.top, 50)
            
            HStack(spacing: 100){
                VStack{
                    Image("waterfall")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .border(Color.green)
                        .presentationCornerRadius(10)
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            waterfallImage.toggle()
                        }
                    
                    Text("BEFORE")
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
                
                VStack{
                    Image("DemoImage")
                        .resizable()
                        .frame(width: 120, height: 100)
                        .border(Color.green)
                        .presentationCornerRadius(10)
                        .onTapGesture {
                            photograph.toggle()
                        }
                    
                    Text("CURRENT")
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
            }
            VStack{
                Spacer()
                Text("Brad Zoltz")
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.white)
                
                Text("Contest Prep | Coach Brad")
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
                    .padding(.bottom)
            }
        }
    }
    
    var images: some View{
        VStack{
            if viewModel.bannerData.isEmpty{
                Text("Loading...")
            } else{
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(viewModel.bannerData, id: \.id) { bannerData in
                            if let url = URL(string: bannerData.image) {
                                URLImage(url) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(10)
                                    //                                            .frame(maxWidth: 500)
                                        .frame(height: 100)
                                        .frame(width: 300)
                                    //                                            .clipped()
                                        .padding()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    var elements: some View{
        HStack(spacing: 20){
            VStack{
                NavigationLink(destination: BodyStats()) {
                    Text("Body Stats")
                        .foregroundStyle(Color.green)
                        .frame(width: 160, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.green, lineWidth: 1)
                        )
                }
                
                NavigationLink(destination: Charts()){
                    Text("Charts")
                        .foregroundStyle(Color.green)
                        .frame(width: 160, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.green, lineWidth: 1)
                        )

                }
                
                NavigationLink(destination: Referal()){
                    Text("Referal")
                        .foregroundStyle(Color.green)
                        .frame(width: 160, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.green, lineWidth: 1)
                        )

                }
                
                Image(systemName: "dumbbell")
                    .resizable()
                    .frame(width: 160, height: 100)
                    .foregroundStyle(Color.green)
                    .padding(.top)
            }
            
            VStack{
                HStack(spacing: 20){
                    VStack{
                        NavigationLink(destination: MealPlan()){
                            Image(systemName: "airtag")
                                .font(.system(size: 35))
                                .frame(width: 70, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                                .foregroundStyle(Color.black)
                        }
                        
                        Text("Meal Plan")
                            .font(.system(size: 13))
                            .padding(.vertical, 7)
                    }
                    VStack{
                        NavigationLink(destination: Workout()){
                            Image(systemName: "dumbbell")
                                .font(.system(size: 35))
                                .frame(width: 70, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                                .foregroundStyle(Color.black)
                        }
                        
                        Text("Workout")
                            .font(.system(size: 13))
                            .padding(.vertical, 7)
                    }
                }
                
                HStack(spacing: 20){
                    VStack{
                        NavigationLink(destination: WeeklyCheckIn()){
                            Image(systemName: "calendar")
                                .font(.system(size: 35))
                                .frame(width: 70, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                                .foregroundStyle(Color.black)
                        }
                        
                            Text("Weekly CheckIn")
                                .font(.system(size: 13))
                                .padding(.vertical, 7)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 70)
                    }
                    VStack{
                        NavigationLink(destination: MonthlyCheckIn()){
                            Image(systemName: "calendar.day.timeline.left")
                                .font(.system(size: 35))
                                .frame(width: 70, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                                .foregroundStyle(Color.black)
                        }
                        
                        Text("Monthly CheckIn")
                            .font(.system(size: 13))
                            .padding(.vertical, 7)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: 70)
                    }
                }
                
                HStack(spacing: 20){
                    VStack{
                        NavigationLink(destination: Photos()){
                            Image(systemName: "photo.fill.on.rectangle.fill")
                                .font(.system(size: 35))
                                .frame(width: 70, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                                .foregroundStyle(Color.black)
                        }
                    }
                    VStack{
                        NavigationLink(destination: Videos()){
                            Image(systemName: "video")
                                .font(.system(size: 35))
                                .frame(width: 70, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                                .foregroundStyle(Color.black)
                        }
                    }
                }
            }
        }
    }
}
