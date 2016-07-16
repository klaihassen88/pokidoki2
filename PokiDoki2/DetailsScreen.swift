//
//  DetailsScreen.swift
//  PokiDoki2
//
//  Created by hassen klai on 7/15/16.
//  Copyright © 2016 hassen klai. All rights reserved.
//

import Foundation
import UIKit
class DetailsScreen : UIViewController {
    
    @IBOutlet weak var lbl : UILabel!
    var pokeNew : Poke!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = pokeNew.name
        
    }
    
}