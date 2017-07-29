//
//  IngredientData.swift
//  GreenEats
//
//  Created by Felix Kramer on 29/7/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//

import Foundation

class Data {
    class func getData() -> [IngredientClass] {
        var data = [IngredientClass]()
        
        data.append(IngredientClass(ingredientName: "Apple", ingredientIcon: "apple", emissionsPerKg: 0.24, standardPortionName: "each", standardPortionSizeKg: 0.1))
        data.append(IngredientClass(ingredientName: "Artichoke", ingredientIcon: "artichoke", emissionsPerKg: 0.26, standardPortionName: "each", standardPortionSizeKg: 0.128))
        data.append(IngredientClass(ingredientName: "Banana", ingredientIcon: "banana", emissionsPerKg: 0.26, standardPortionName: "each", standardPortionSizeKg: 0.18))
        data.append(IngredientClass(ingredientName: "Broccoli", ingredientIcon: "broccoli", emissionsPerKg: 0.16, standardPortionName: "heads", standardPortionSizeKg: 0.45))
        
        return data
    }
}
