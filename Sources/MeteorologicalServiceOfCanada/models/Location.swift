//
//  File.swift
//  
//
//  Created by Alan Chu on 9/10/20.
//

import Foundation

public struct Location: Decodable, Equatable {
    let continent: String
    let country: String
    let province: String
    let name: String
    let region: String

//    let coordinate: (latitude: Double, longitude: Double)
}
