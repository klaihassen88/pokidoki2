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
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainDescription: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var podexIdLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var currentEvolution: UIImageView!
    @IBOutlet weak var nextEvolution: UIImageView!
    
    var pokeNew : Poke!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func BackButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}