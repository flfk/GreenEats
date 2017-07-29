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
    private var _emissionsPerKg: Double!
    private var _standardPortionName: String!
    private var _standardPortionSizeKg: Double!

    
    var ingredientName: String {
        return _ingredientName
    }
    
    var ingredientIcon: String {
        return _ingredientIcon
    }
    
    var emissionsPerKg: Double {
        return _emissionsPerKg
    }
    
    var standardPortionName: String {
        return _standardPortionName
    }
    
    var standardPortionSizeKg: Double {
        return _standardPortionSizeKg
    }
    
    //initialise class
    init (ingredientName: String, ingredientIcon: String, emissionsPerKg: Double, standardPortionName: String,standardPortionSizeKg: Double) {
        _ingredientName = ingredientName
        _ingredientIcon = ingredientIcon
        _emissionsPerKg = emissionsPerKg
        _standardPortionName = standardPortionName
        _standardPortionSizeKg = standardPortionSizeKg
    }
    
}
