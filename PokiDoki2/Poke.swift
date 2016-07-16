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
    
    private var _name : String!
    private var _img : Int!
    private var _mainImg : Int!
    private var _mainDescription: String!
    private var _type: String!
    private var _defense: Int!
    private var _height: Int!
    private var _weight : Int!
    private var _baseAttack :Int!
    private var _nextEvolution : String!
    
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