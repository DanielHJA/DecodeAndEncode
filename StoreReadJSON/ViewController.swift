//
//  ViewController.swift
//  StoreReadJSON
//
//  Created by Daniel Hjärtström on 2019-08-20.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        if let data = Mockdata.snacks().encode()?.data {
//            data.storeAs("snacks", type: .json)
//        }
        if let data = Data.fetch("snacks", type: .json) {
            if let snacks: [Snack] = data.decode() {
                print(snacks)
            }
        }

    }


}

