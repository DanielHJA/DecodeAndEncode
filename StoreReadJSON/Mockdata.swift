//
//  Mockdata.swift
//  StoreReadJSON
//
//  Created by Daniel Hjärtström on 2019-08-20.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

class Mockdata {
    class func snacks() -> [Snack] {
        return [
            Snack(name: "Grillchips", weight: 0.3, flavours: [Flavour.salty], type: .chips, colors: [Color.yellow], cost: 20.0, available: true),
            Snack(name: "Toblerone", weight: 0.4, flavours: [Flavour.sweet], type: .chocolate, colors: [Color.brown], cost: 40.0, available: false),
            Snack(name: "Popcorn", weight: 0.1, flavours: [Flavour.salty, Flavour.sweet], type: .popcorn, colors: [Color.white], cost: 20.0, available: true),
            Snack(name: "GB Glass", weight: 1.0, flavours: [.sweet], type: .iceCream, colors: [Color.white], cost: 24.0, available: false),
        ]
    }
}
