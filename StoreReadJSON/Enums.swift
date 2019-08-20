//
//  Enums.swift
//  StoreReadJSON
//
//  Created by Daniel Hjärtström on 2019-08-20.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

enum Flavour: String, Codable {
    case spicy = "spicy"
    case salty = "salty"
    case sour = "sour"
    case sweet = "sweet"
    case bitter = "bitter"
}

enum SnackType: String, Codable {
    case candy = "candy"
    case chocolate = "chocolate"
    case chips = "chips"
    case popcorn = "popcorn"
    case soda = "soda"
    case iceCream = "ice-cream"
}

enum Color: String, Codable {
    case red = "red"
    case blue = "blue"
    case yellow = "yellow"
    case brown = "brown"
    case white = "white"
    
    var color: UIColor {
        switch self {
        case .red:
            return .red
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .brown:
            return .brown
        case .white:
            return .white
        }
    }
}

enum FileType: String {
    case json = "json"
}
