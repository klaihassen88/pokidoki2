//
//  Poke.swift
//  PokiDoki2
//
//  Created by hassen klai on 7/14/16.
//  Copyright © 2016 hassen klai. All rights reserved.
//

import Foundation
import UIKit

class Poke {
    
    private var _name : String
    private var _img : Int
    
    var name : String{
        return _name
    }
    
    var img : Int{
        return _img
    }
    
    init(name :String, img:Int){
        
        _name = name
        _img = img
    }
}