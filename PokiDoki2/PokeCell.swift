//
//  PokeCell.swift
//  PokiDoki2
//
//  Created by hassen klai on 7/14/16.
//  Copyright © 2016 hassen klai. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCell :UIImageView!
    @IBOutlet weak var labelCell :UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        layer.cornerRadius = 5
        
    }
    var poke : Poke!
    
    func configCell(poke : Poke){
        
        self.poke = poke
        imgCell.image = UIImage(named: "\(poke.img)")
        labelCell.text = poke.name.capitalizedString
    }
    
}
