//
//  BannerNetworkService.swift
//  QuantamITSolution
//
//  Created by Chetan Choudhary on 14/05/24.
//

import Foundation

class BannerNetworkService{
    
    func fetchData(completion: @escaping (Result<[BannerData], Error>) -> Void) {
        guard let url = URL(string: "https://securityoncalls.com/projects/brad/api/banners") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 1, userInfo: nil)))
                return
            }
            
            do {
                let bannerData = try JSONDecoder().decode([BannerData].self, from: data)
                completion(.success(bannerData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
