//
//  Response.swift
//  QuantamITSolution
//
//  Created by Chetan Choudhary on 14/05/24.
//
import Foundation

struct Response<T: Codable>: Codable {
    let action: String
    let code: Int
    let status: Bool
    var data: T?
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case action, code, status, data, message
    }

//    func getData() throws -> T? {
//        guard code == 200 else {
//            throw APIError(statusCode: code, message: message)
//        }
//        return data
//    }
//
//    func getObject() throws -> T {
//        if code != 200 {
//            throw
//        }
//        guard let data = data else {
//            throw APIError(statusCode: code, message: "Invalid data")
//        }
//        return data
//    }
}
