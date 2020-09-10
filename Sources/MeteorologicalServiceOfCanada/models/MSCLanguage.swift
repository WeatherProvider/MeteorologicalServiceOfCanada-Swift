//
//  File.swift
//  
//
//  Created by Alan Chu on 9/10/20.
//

import Foundation

public enum MSCLanguage {
    case english
    case french

    public var oneLetter: String {
        switch self {
        case .english: return "e"
        case .french: return "f"
        }
    }

    public var twoLetter: String {
        switch self {
        case .english: return "en"
        case .french: return "fr"
        }
    }
}
