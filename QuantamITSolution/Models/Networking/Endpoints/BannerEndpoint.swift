//
//  BannerEndpoint.swift
//  QuantamITSolution
//
//  Created by Chetan Choudhary on 14/05/24.
//

import Foundation

enum BannerEndpoint: String, EndpointProtocol{
    
    case getBannerData = "https://securityoncalls.com/projects/brad/api/banners"
    
    var path: String{
        return rawValue
    }
    
    var method: HTTPMethod_Enum{
        switch self{
        case .getBannerData:
                return .get
        }
    }
}
