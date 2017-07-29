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
        
        data.append(IngredientClass(ingredientName: "Broccoli", ingredientIcon: "broccoli"))
        data.append(IngredientClass(ingredientName: "Apple", ingredientIcon: "apple"))
        data.append(IngredientClass(ingredientName: "Artichoke", ingredientIcon: "artichoke"))
        data.append(IngredientClass(ingredientName: "Aubergine", ingredientIcon: "aubergine"))
        
        return data
    }
}
