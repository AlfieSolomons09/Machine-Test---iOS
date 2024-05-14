//
//  EndpointProtocol.swift
//  QuantamITSolution
//
//  Created by Chetan Choudhary on 14/05/24.
//

import Foundation

protocol EndpointProtocol {
    var path: String { get }
    var method: HTTPMethod_Enum { get }
}
