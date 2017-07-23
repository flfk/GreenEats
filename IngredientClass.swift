//
//  IngredientData.swift
//  GreenEats
//
//  Created by Felix Kramer on 24/7/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//

import Foundation

class IngredientClass {
    private var _ingredientName: String!
    private var _ingredientIcon: String!
    
    var ingredientName: String {
        return _ingredientName
    }
    
    var ingredientIcon: String {
        return _ingredientIcon
    }
    
    //initialise class
    init (ingredientName: String, ingredientIcon: String) {
        _ingredientName = ingredientName
        _ingredientIcon = ingredientIcon
    }
    
    
}
