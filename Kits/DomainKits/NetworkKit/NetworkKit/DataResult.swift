//
//  DataResult.swift
//  NetworkKit
//
//  Created by Engin Gülek on 18.09.2024.
//

import Foundation

public struct DataResult<T:Decodable> : Decodable {
    let success: Bool
    let message: String
    public let data:T
}
