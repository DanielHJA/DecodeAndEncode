//
//  Food.swift
//  StoreReadJSON
//
//  Created by Daniel Hjärtström on 2019-08-20.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

struct Snack: Codable {

    var name: String
    var weight: Double
    var flavours: [Flavour]
    var type: SnackType
    var colors: [Color]
    var cost: Double
    var available: Bool
    
    private enum CodingKeys: String, CodingKey {
        case response = "response"
        case name = "name"
        case weight = "weight"
        case flavours = "flavours"
        case type = "type"
        case colors = "colors"
        case cost = "cost"
        case available = "available"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        weight = try container.decode(Double.self, forKey: .weight)
        flavours = try container.decode([Flavour].self, forKey: .flavours)
        type = try container.decode(SnackType.self, forKey: .type)
        colors = try container.decode([Color].self, forKey: .colors)
        cost = try container.decode(Double.self, forKey: .cost)
        available = try container.decode(Bool.self, forKey: .available)
    }
    
    init(name: String, weight: Double, flavours: [Flavour], type: SnackType, colors: [Color], cost: Double, available: Bool) {
        self.name = name
        self.weight = weight
        self.flavours = flavours
        self.type = type
        self.colors = colors
        self.cost = cost
        self.available = available
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(weight, forKey: .weight)
        try container.encode(flavours, forKey: .flavours)
        try container.encode(type, forKey: .type)
        try container.encode(colors, forKey: .colors)
        try container.encode(cost, forKey: .cost)
        try container.encode(available, forKey: .available)
    }
    
}
