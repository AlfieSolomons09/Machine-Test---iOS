//
//  OnboardingViewModel.swift
//  QuantamITSolution
//
//  Created by Chetan Choudhary on 14/05/24.
//

import Foundation

class OnboardingViewModel: ObservableObject{
    @Published var bannerData: [BannerData] = []
    let apiManager = BannerNetworkService()
    
    func fetchData(){
        apiManager.fetchData { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.bannerData = data
                    print("OnboardingViewModel:fetchData: Data Fetched")
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }
        }
    }
}
