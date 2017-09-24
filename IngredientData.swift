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
        
        data.append(IngredientClass(ingredientName: "Almonds", ingredientIcon: "", emissionsPerKg: 1.8959732, standardPortionName: "each", standardPortionSizeKg: 0.0012))
        data.append(IngredientClass(ingredientName: "Almonds, organic", ingredientIcon: "", emissionsPerKg: 3.5714844, standardPortionName: "each", standardPortionSizeKg: 0.0012))
        data.append(IngredientClass(ingredientName: "Apples", ingredientIcon: "apple", emissionsPerKg: 0.2425082, standardPortionName: "each", standardPortionSizeKg: 0.185))
        data.append(IngredientClass(ingredientName: "Apricots", ingredientIcon: "", emissionsPerKg: 0.220462, standardPortionName: "each", standardPortionSizeKg: 0.035))
        data.append(IngredientClass(ingredientName: "Arctic Char", ingredientIcon: "fish", emissionsPerKg: 18.4306232, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Artichokes", ingredientIcon: "artichoke", emissionsPerKg: 0.2645544, standardPortionName: "each", standardPortionSizeKg: 0.13))
        data.append(IngredientClass(ingredientName: "Asparagus", ingredientIcon: "asparagus", emissionsPerKg: 0.881848, standardPortionName: "spears", standardPortionSizeKg: 0.03))
        data.append(IngredientClass(ingredientName: "Aubergine", ingredientIcon: "aubergine", emissionsPerKg: 0.5070626, standardPortionName: "each", standardPortionSizeKg: 0.45))
        data.append(IngredientClass(ingredientName: "Avocado", ingredientIcon: "", emissionsPerKg: 1.37200311, standardPortionName: "each", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Bacon", ingredientIcon: "", emissionsPerKg: 5.4674576, standardPortionName: "rashers", standardPortionSizeKg: 0.025))
        data.append(IngredientClass(ingredientName: "Bananas", ingredientIcon: "banana", emissionsPerKg: 0.2645544, standardPortionName: "each", standardPortionSizeKg: 0.18))
        data.append(IngredientClass(ingredientName: "Barley", ingredientIcon: "", emissionsPerKg: 0.3086468, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Barley, organic", ingredientIcon: "", emissionsPerKg: 0.551155, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Beans, Blackeye", ingredientIcon: "beans", emissionsPerKg: 0.5732012, standardPortionName: "can", standardPortionSizeKg: 0.4))
        data.append(IngredientClass(ingredientName: "Beans, Chinese Long Bean", ingredientIcon: "beans", emissionsPerKg: 0.2645544, standardPortionName: "cup", standardPortionSizeKg: 0.09))
        data.append(IngredientClass(ingredientName: "Beans, Dry Beans", ingredientIcon: "beans", emissionsPerKg: 0.7936632, standardPortionName: "cup", standardPortionSizeKg: 0.2))
        data.append(IngredientClass(ingredientName: "Beans, Green", ingredientIcon: "beans", emissionsPerKg: 0.440924, standardPortionName: "each", standardPortionSizeKg: 0.4))
        data.append(IngredientClass(ingredientName: "Beans, Lima", ingredientIcon: "beans", emissionsPerKg: 0.7495708, standardPortionName: "each", standardPortionSizeKg: 0.4))
        data.append(IngredientClass(ingredientName: "Beans, Snap Beans", ingredientIcon: "beans", emissionsPerKg: 0.2425082, standardPortionName: "each", standardPortionSizeKg: 0.4))
        data.append(IngredientClass(ingredientName: "Beef", ingredientIcon: "steak", emissionsPerKg: 17.63696, standardPortionName: "serving", standardPortionSizeKg: 0.225))
        data.append(IngredientClass(ingredientName: "Beer", ingredientIcon: "", emissionsPerKg: 0.3747854, standardPortionName: "pint", standardPortionSizeKg: 0.5))
        data.append(IngredientClass(ingredientName: "Bell Peppers", ingredientIcon: "", emissionsPerKg: 0.2645544, standardPortionName: "each", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Bitter melon", ingredientIcon: "", emissionsPerKg: 0.110231, standardPortionName: "each", standardPortionSizeKg: 0.13))
        data.append(IngredientClass(ingredientName: "Blackberries", ingredientIcon: "raspberry", emissionsPerKg: 0.2866006, standardPortionName: "each", standardPortionSizeKg: 0.0035))
        data.append(IngredientClass(ingredientName: "Blood Oranges", ingredientIcon: "orange", emissionsPerKg: 0.1763696, standardPortionName: "each", standardPortionSizeKg: 0.14))
        data.append(IngredientClass(ingredientName: "Blueberries", ingredientIcon: "raspberry", emissionsPerKg: 0.8377556, standardPortionName: "each", standardPortionSizeKg: 0.0035))
        data.append(IngredientClass(ingredientName: "Boysenberries", ingredientIcon: "raspberry", emissionsPerKg: 0.1984158, standardPortionName: "each", standardPortionSizeKg: 0.0035))
        data.append(IngredientClass(ingredientName: "Bread", ingredientIcon: "bread", emissionsPerKg: 0.8377556, standardPortionName: "slice", standardPortionSizeKg: 0.04))
        data.append(IngredientClass(ingredientName: "Bread Flour", ingredientIcon: "bread", emissionsPerKg: 0.551155, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Breakfast Cereal", ingredientIcon: "", emissionsPerKg: 2.1605276, standardPortionName: "bowl", standardPortionSizeKg: 0.08))
        data.append(IngredientClass(ingredientName: "Broccoli", ingredientIcon: "broccoli", emissionsPerKg: 0.3527392, standardPortionName: "bunch", standardPortionSizeKg: 0.6))
        data.append(IngredientClass(ingredientName: "Brussels Sprouts", ingredientIcon: "", emissionsPerKg: 0.2645544, standardPortionName: "each", standardPortionSizeKg: 0.01))
        data.append(IngredientClass(ingredientName: "Butter", ingredientIcon: "butter", emissionsPerKg: 23.8, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Butternut Pumpkin", ingredientIcon: "pumpkin", emissionsPerKg: 0.1543234, standardPortionName: "each", standardPortionSizeKg: 1.3))
        data.append(IngredientClass(ingredientName: "Cabbage", ingredientIcon: "lettuce", emissionsPerKg: 0.1322772, standardPortionName: "head", standardPortionSizeKg: 0.9))
        data.append(IngredientClass(ingredientName: "Cabbage, chinese", ingredientIcon: "lettuce", emissionsPerKg: 0.0881848, standardPortionName: "head", standardPortionSizeKg: 0.84))
        data.append(IngredientClass(ingredientName: "Canola Oil", ingredientIcon: "olive-oil", emissionsPerKg: 1.6975574, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Canola Seeds", ingredientIcon: "", emissionsPerKg: 0.8598018, standardPortionName: "cup", standardPortionSizeKg: 0.16))
        data.append(IngredientClass(ingredientName: "Cantaloupe", ingredientIcon: "", emissionsPerKg: 0.1322772, standardPortionName: "each", standardPortionSizeKg: 1.5))
        data.append(IngredientClass(ingredientName: "Carp", ingredientIcon: "fish", emissionsPerKg: 9.5680508, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Carrots", ingredientIcon: "carrot", emissionsPerKg: 0.110231, standardPortionName: "each", standardPortionSizeKg: 0.8))
        data.append(IngredientClass(ingredientName: "Catfish", ingredientIcon: "fish", emissionsPerKg: 9.369635, standardPortionName: "fillet", standardPortionSizeKg: 0.12))
        data.append(IngredientClass(ingredientName: "Cauliflower", ingredientIcon: "", emissionsPerKg: 0.3086468, standardPortionName: "head", standardPortionSizeKg: 0.9))
        data.append(IngredientClass(ingredientName: "Celery", ingredientIcon: "", emissionsPerKg: 0.110231, standardPortionName: "stalks", standardPortionSizeKg: 0.5))
        data.append(IngredientClass(ingredientName: "Cheese", ingredientIcon: "", emissionsPerKg: 8.3, standardPortionName: "slice", standardPortionSizeKg: 0.03))
        data.append(IngredientClass(ingredientName: "Cherries", ingredientIcon: "cherry", emissionsPerKg: 0.2425082, standardPortionName: "each", standardPortionSizeKg: 0.55))
        data.append(IngredientClass(ingredientName: "Chicken, caged", ingredientIcon: "roast-chicken", emissionsPerKg: 3.747854, standardPortionName: "breast", standardPortionSizeKg: 0.2))
        data.append(IngredientClass(ingredientName: "Chicken, free-range", ingredientIcon: "roast-chicken", emissionsPerKg: 5.5997348, standardPortionName: "breast", standardPortionSizeKg: 0.2))
        data.append(IngredientClass(ingredientName: "Chickpeas", ingredientIcon: "", emissionsPerKg: 0.6393398, standardPortionName: "can", standardPortionSizeKg: 0.4))
        data.append(IngredientClass(ingredientName: "Cilantro", ingredientIcon: "", emissionsPerKg: 0.1984158, standardPortionName: "sprigs", standardPortionSizeKg: 0.002))
        data.append(IngredientClass(ingredientName: "Coca cola", ingredientIcon: "", emissionsPerKg: 1.7196036, standardPortionName: "can", standardPortionSizeKg: 0.35))
        data.append(IngredientClass(ingredientName: "Cocoa Beans", ingredientIcon: "", emissionsPerKg: 0.5732012, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Cocoa Butter", ingredientIcon: "", emissionsPerKg: 1.1464024, standardPortionName: "tbsp", standardPortionSizeKg: 0.02))
        data.append(IngredientClass(ingredientName: "Cocoa Liquor", ingredientIcon: "", emissionsPerKg: 0.8157094, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Cocoa Powder", ingredientIcon: "", emissionsPerKg: 0.1984158, standardPortionName: "tbsp", standardPortionSizeKg: 0.008))
        data.append(IngredientClass(ingredientName: "Coconut Oil", ingredientIcon: "", emissionsPerKg: 0.9038942, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Cod", ingredientIcon: "fish", emissionsPerKg: 5.2690418, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Coffee", ingredientIcon: "", emissionsPerKg: 2.5132668, standardPortionName: "each", standardPortionSizeKg: 0.24))
        data.append(IngredientClass(ingredientName: "Cooking/Salad Oil", ingredientIcon: "olive-oil", emissionsPerKg: 1.7416498, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Coriander", ingredientIcon: "", emissionsPerKg: 0.1984158, standardPortionName: "sprigs", standardPortionSizeKg: 0.002))
        data.append(IngredientClass(ingredientName: "Corn Oil", ingredientIcon: "olive-oil", emissionsPerKg: 0.2645544, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Corn Syrup", ingredientIcon: "honey", emissionsPerKg: 0.330693, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Cottage Cheese", ingredientIcon: "cheese", emissionsPerKg: 0.2645544, standardPortionName: "tbsp", standardPortionSizeKg: 0.02))
        data.append(IngredientClass(ingredientName: "Cream Cheese", ingredientIcon: "", emissionsPerKg: 0.2645544, standardPortionName: "tbsp", standardPortionSizeKg: 0.02))
        data.append(IngredientClass(ingredientName: "Cucumbers", ingredientIcon: "", emissionsPerKg: 0.1322772, standardPortionName: "each", standardPortionSizeKg: 0.16))
        data.append(IngredientClass(ingredientName: "Cucurbits, Moqua/Opo", ingredientIcon: "", emissionsPerKg: 0.0661386, standardPortionName: "each", standardPortionSizeKg: 0.16))
        data.append(IngredientClass(ingredientName: "Cucurbits, Sinqua", ingredientIcon: "", emissionsPerKg: 0.0881848, standardPortionName: "each", standardPortionSizeKg: 0.16))
        data.append(IngredientClass(ingredientName: "Dates", ingredientIcon: "", emissionsPerKg: 0.440924, standardPortionName: "each", standardPortionSizeKg: 0.024))
        data.append(IngredientClass(ingredientName: "Eggplants", ingredientIcon: "aubergine", emissionsPerKg: 0.5070626, standardPortionName: "each", standardPortionSizeKg: 0.45))
        data.append(IngredientClass(ingredientName: "Eggplants, Asian Style", ingredientIcon: "aubergine", emissionsPerKg: 0.0881848, standardPortionName: "each", standardPortionSizeKg: 0.45))
        data.append(IngredientClass(ingredientName: "Eggs", ingredientIcon: "fried-egg", emissionsPerKg: 2.0282504, standardPortionName: "each", standardPortionSizeKg: 0.06))
        data.append(IngredientClass(ingredientName: "Feta", ingredientIcon: "", emissionsPerKg: 5.81, standardPortionName: "serving", standardPortionSizeKg: 0.03))
        data.append(IngredientClass(ingredientName: "Figs", ingredientIcon: "", emissionsPerKg: 1.543234, standardPortionName: "each", standardPortionSizeKg: 0.024))
        data.append(IngredientClass(ingredientName: "Flatfish", ingredientIcon: "fish", emissionsPerKg: 3.0644218, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Flour", ingredientIcon: "", emissionsPerKg: 0.6393398, standardPortionName: "cup", standardPortionSizeKg: 0.12))
        data.append(IngredientClass(ingredientName: "Garlic", ingredientIcon: "garlic", emissionsPerKg: 0.9479866, standardPortionName: "clove", standardPortionSizeKg: 0.005))
        data.append(IngredientClass(ingredientName: "Grapes", ingredientIcon: "grape", emissionsPerKg: 0.8377556, standardPortionName: "grapes", standardPortionSizeKg: 0.005))
        data.append(IngredientClass(ingredientName: "Guava", ingredientIcon: "", emissionsPerKg: 0.1543234, standardPortionName: "each", standardPortionSizeKg: 0.06))
        data.append(IngredientClass(ingredientName: "Halloumi", ingredientIcon: "", emissionsPerKg: 5.81, standardPortionName: "serving", standardPortionSizeKg: 0.05))
        data.append(IngredientClass(ingredientName: "Ham", ingredientIcon: "", emissionsPerKg: 9.3255426, standardPortionName: "slice", standardPortionSizeKg: 0.02))
        data.append(IngredientClass(ingredientName: "Hash Brown", ingredientIcon: "", emissionsPerKg: 3.968316, standardPortionName: "each", standardPortionSizeKg: 0.06))
        data.append(IngredientClass(ingredientName: "Herring", ingredientIcon: "fish", emissionsPerKg: 1.2345872, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Ice Cream", ingredientIcon: "ice-cream", emissionsPerKg: 1.8298346, standardPortionName: "scoops", standardPortionSizeKg: 0.07))
        data.append(IngredientClass(ingredientName: "Instant Mashed Potatoes", ingredientIcon: "", emissionsPerKg: 4.519471, standardPortionName: "packet", standardPortionSizeKg: 0.12))
        data.append(IngredientClass(ingredientName: "Ketchup", ingredientIcon: "tomato", emissionsPerKg: 2.2487124, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Lamb", ingredientIcon: "", emissionsPerKg: 24.9342522, standardPortionName: "chops", standardPortionSizeKg: 0.03))
        data.append(IngredientClass(ingredientName: "Lemongrass", ingredientIcon: "", emissionsPerKg: 0.0661386, standardPortionName: "sprigs", standardPortionSizeKg: 0.002))
        data.append(IngredientClass(ingredientName: "Lemons", ingredientIcon: "lemon", emissionsPerKg: 0.0881848, standardPortionName: "each", standardPortionSizeKg: 0.06))
        data.append(IngredientClass(ingredientName: "Lentils", ingredientIcon: "", emissionsPerKg: 0.5291088, standardPortionName: "cup", standardPortionSizeKg: 0.2))
        data.append(IngredientClass(ingredientName: "Lettuce", ingredientIcon: "lettuce", emissionsPerKg: 0.0881848, standardPortionName: "head", standardPortionSizeKg: 0.9))
        data.append(IngredientClass(ingredientName: "Liquid Eggs", ingredientIcon: "", emissionsPerKg: 2.1605276, standardPortionName: "each", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Lobster", ingredientIcon: "prawn", emissionsPerKg: 5.3792728, standardPortionName: "each", standardPortionSizeKg: 0.85))
        data.append(IngredientClass(ingredientName: "Mackerel", ingredientIcon: "fish", emissionsPerKg: 1.9180194, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Malt Whisky", ingredientIcon: "", emissionsPerKg: 2.7337288, standardPortionName: "shot", standardPortionSizeKg: 0.03))
        data.append(IngredientClass(ingredientName: "Mandarin Oranges", ingredientIcon: "orange", emissionsPerKg: 0.220462, standardPortionName: "each", standardPortionSizeKg: 0.09))
        data.append(IngredientClass(ingredientName: "Mango", ingredientIcon: "", emissionsPerKg: 0.0661386, standardPortionName: "each", standardPortionSizeKg: 0.55))
        data.append(IngredientClass(ingredientName: "Margarine", ingredientIcon: "", emissionsPerKg: 1.763696, standardPortionName: "tbsp", standardPortionSizeKg: 0.02))
        data.append(IngredientClass(ingredientName: "Marinara Sauce", ingredientIcon: "", emissionsPerKg: 0.8377556, standardPortionName: "cup", standardPortionSizeKg: 0.24))
        data.append(IngredientClass(ingredientName: "Melons", ingredientIcon: "", emissionsPerKg: 0.1322772, standardPortionName: "each", standardPortionSizeKg: 0.55))
        data.append(IngredientClass(ingredientName: "Milk, condensed", ingredientIcon: "", emissionsPerKg: 2.5132668, standardPortionName: "can", standardPortionSizeKg: 0.27))
        data.append(IngredientClass(ingredientName: "Milk, evaporated", ingredientIcon: "", emissionsPerKg: 2.5132668, standardPortionName: "can", standardPortionSizeKg: 0.27))
        data.append(IngredientClass(ingredientName: "Milk, full cream", ingredientIcon: "milk-1", emissionsPerKg: 1.0141252, standardPortionName: "glass", standardPortionSizeKg: 0.25))
        data.append(IngredientClass(ingredientName: "Milk, low-fat", ingredientIcon: "milk-1", emissionsPerKg: 0.7936632, standardPortionName: "glass", standardPortionSizeKg: 0.25))
        data.append(IngredientClass(ingredientName: "Milk, powdered", ingredientIcon: "", emissionsPerKg: 9.7444204, standardPortionName: "cup", standardPortionSizeKg: 0.2))
        data.append(IngredientClass(ingredientName: "Mozzarella", ingredientIcon: "", emissionsPerKg: 5.81, standardPortionName: "slice", standardPortionSizeKg: 0.03))
        data.append(IngredientClass(ingredientName: "Mullet", ingredientIcon: "fish", emissionsPerKg: 5.3131342, standardPortionName: "fillet", standardPortionSizeKg: 0.1))
        data.append(IngredientClass(ingredientName: "Mushrooms", ingredientIcon: "mushroom", emissionsPerKg: 0, standardPortionName: "each", standardPortionSizeKg: 0.02))
        data.append(IngredientClass(ingredientName: "Mussels", ingredientIcon: "mussel", emissionsPerKg: 0.5291088, standardPortionName: "each", standardPortionSizeKg: 0.035))
        data.append(IngredientClass(ingredientName: "Mustard", ingredientIcon: "", emissionsPerKg: 0.992079, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Nectarines", ingredientIcon: "orange", emissionsPerKg: 0.220462, standardPortionName: "each", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Noodles", ingredientIcon: "noodles", emissionsPerKg: 1.2345872, standardPortionName: "serving", standardPortionSizeKg: 0.125))
        data.append(IngredientClass(ingredientName: "Noodles, whole wheat", ingredientIcon: "noodles", emissionsPerKg: 1.0582176, standardPortionName: "serving", standardPortionSizeKg: 0.125))
        data.append(IngredientClass(ingredientName: "Oat Bran", ingredientIcon: "", emissionsPerKg: 0.4850164, standardPortionName: "cup", standardPortionSizeKg: 0.1))
        data.append(IngredientClass(ingredientName: "Oats", ingredientIcon: "", emissionsPerKg: 0.4850164, standardPortionName: "cup", standardPortionSizeKg: 0.09))
        data.append(IngredientClass(ingredientName: "Okra", ingredientIcon: "", emissionsPerKg: 0.2425082, standardPortionName: "each", standardPortionSizeKg: 0.02))
        data.append(IngredientClass(ingredientName: "Olive Oil", ingredientIcon: "", emissionsPerKg: 1.7416498, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Olives", ingredientIcon: "olives", emissionsPerKg: 0.2866006, standardPortionName: "each", standardPortionSizeKg: 0.011))
        data.append(IngredientClass(ingredientName: "Onions", ingredientIcon: "onion", emissionsPerKg: 0.0881848, standardPortionName: "each", standardPortionSizeKg: 0.11))
        data.append(IngredientClass(ingredientName: "Orange Juice", ingredientIcon: "orange", emissionsPerKg: 2.1384814, standardPortionName: "glass", standardPortionSizeKg: 0.24))
        data.append(IngredientClass(ingredientName: "Oranges", ingredientIcon: "orange", emissionsPerKg: 0.1322772, standardPortionName: "each", standardPortionSizeKg: 0.14))
        data.append(IngredientClass(ingredientName: "Oysters", ingredientIcon: "mussel", emissionsPerKg: 11.4419778, standardPortionName: "each", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Palm Kernel Oil", ingredientIcon: "olive-oil", emissionsPerKg: 0.9038942, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Palm Kernels", ingredientIcon: "", emissionsPerKg: 0.330693, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Palm Oil", ingredientIcon: "olive-oil", emissionsPerKg: 0.440924, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Parsley", ingredientIcon: "", emissionsPerKg: 0.1543234, standardPortionName: "sprigs", standardPortionSizeKg: 0.002))
        data.append(IngredientClass(ingredientName: "Pasta", ingredientIcon: "pasta", emissionsPerKg: 1.2345872, standardPortionName: "serving", standardPortionSizeKg: 0.125))
        data.append(IngredientClass(ingredientName: "Pasta, whole wheat", ingredientIcon: "pasta", emissionsPerKg: 1.0582176, standardPortionName: "serving", standardPortionSizeKg: 0.125))
        data.append(IngredientClass(ingredientName: "Pastry Flour", ingredientIcon: "", emissionsPerKg: 0.5291088, standardPortionName: "cup", standardPortionSizeKg: 0.12))
        data.append(IngredientClass(ingredientName: "Peaches", ingredientIcon: "", emissionsPerKg: 0.220462, standardPortionName: "each", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Peanut Butter", ingredientIcon: "", emissionsPerKg: 1.5211878, standardPortionName: "tspn", standardPortionSizeKg: 0.005))
        data.append(IngredientClass(ingredientName: "Peanut Oil", ingredientIcon: "olive-oil", emissionsPerKg: 3.9021774, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Peanuts", ingredientIcon: "", emissionsPerKg: 0.5732012, standardPortionName: "each", standardPortionSizeKg: 0.0005))
        data.append(IngredientClass(ingredientName: "Pears", ingredientIcon: "", emissionsPerKg: 0.330693, standardPortionName: "each", standardPortionSizeKg: 0.06))
        data.append(IngredientClass(ingredientName: "Peas", ingredientIcon: "beans", emissionsPerKg: 0.2866006, standardPortionName: "can", standardPortionSizeKg: 0.425))
        data.append(IngredientClass(ingredientName: "Pecans", ingredientIcon: "", emissionsPerKg: 1.6093726, standardPortionName: "each", standardPortionSizeKg: 0.0015))
        data.append(IngredientClass(ingredientName: "Peppermint", ingredientIcon: "", emissionsPerKg: 45.0183404, standardPortionName: "sprigs", standardPortionSizeKg: 0.002))
        data.append(IngredientClass(ingredientName: "Pepperoni", ingredientIcon: "", emissionsPerKg: 13.0733966, standardPortionName: "slice", standardPortionSizeKg: 0.005))
        data.append(IngredientClass(ingredientName: "Pepsi", ingredientIcon: "", emissionsPerKg: 1.7196036, standardPortionName: "can", standardPortionSizeKg: 0.35))
        data.append(IngredientClass(ingredientName: "Pineapple", ingredientIcon: "pineapple", emissionsPerKg: 0.0881848, standardPortionName: "each", standardPortionSizeKg: 0.9))
        data.append(IngredientClass(ingredientName: "Pistachios", ingredientIcon: "", emissionsPerKg: 1.1243562, standardPortionName: "each", standardPortionSizeKg: 0.0005))
        data.append(IngredientClass(ingredientName: "Pita Bread", ingredientIcon: "", emissionsPerKg: 0.8377556, standardPortionName: "each", standardPortionSizeKg: 0.06))
        data.append(IngredientClass(ingredientName: "Pizza Dough", ingredientIcon: "", emissionsPerKg: 0.7275246, standardPortionName: "ball", standardPortionSizeKg: 0.25))
        data.append(IngredientClass(ingredientName: "Plums", ingredientIcon: "", emissionsPerKg: 0.220462, standardPortionName: "each", standardPortionSizeKg: 0.08))
        data.append(IngredientClass(ingredientName: "Pomegranates", ingredientIcon: "", emissionsPerKg: 0.440924, standardPortionName: "each", standardPortionSizeKg: 0.26))
        data.append(IngredientClass(ingredientName: "Pork", ingredientIcon: "", emissionsPerKg: 5.4674576, standardPortionName: "chops", standardPortionSizeKg: 0.16))
        data.append(IngredientClass(ingredientName: "Potato Chips", ingredientIcon: "", emissionsPerKg: 3.4392072, standardPortionName: "packet", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Potatoes", ingredientIcon: "", emissionsPerKg: 0.330693, standardPortionName: "each", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Prawn", ingredientIcon: "prawn", emissionsPerKg: 4.5856096, standardPortionName: "each", standardPortionSizeKg: 0.006))
        data.append(IngredientClass(ingredientName: "Prunes", ingredientIcon: "", emissionsPerKg: 0.5070626, standardPortionName: "each", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Pummelos", ingredientIcon: "", emissionsPerKg: 0.220462, standardPortionName: "each", standardPortionSizeKg: 0.2))
        data.append(IngredientClass(ingredientName: "Pumpkins", ingredientIcon: "pumpkin", emissionsPerKg: 0.1543234, standardPortionName: "each", standardPortionSizeKg: 4))
        data.append(IngredientClass(ingredientName: "Quinoa", ingredientIcon: "", emissionsPerKg: 0.5291088, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Radish", ingredientIcon: "radish", emissionsPerKg: 0.1543234, standardPortionName: "each", standardPortionSizeKg: 0.005))
        data.append(IngredientClass(ingredientName: "Raisins", ingredientIcon: "", emissionsPerKg: 0.3086468, standardPortionName: "each", standardPortionSizeKg: 0.0005))
        data.append(IngredientClass(ingredientName: "Rapeseed", ingredientIcon: "", emissionsPerKg: 0.881848, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Raspberries", ingredientIcon: "raspberry", emissionsPerKg: 0.5732012, standardPortionName: "each", standardPortionSizeKg: 0.0035))
        data.append(IngredientClass(ingredientName: "Raspberries", ingredientIcon: "raspberry", emissionsPerKg: 0.2645544, standardPortionName: "each", standardPortionSizeKg: 0.004))
        data.append(IngredientClass(ingredientName: "Rice Bran", ingredientIcon: "", emissionsPerKg: 0.4629702, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Rice, brown", ingredientIcon: "rice", emissionsPerKg: 2.1605276, standardPortionName: "cup", standardPortionSizeKg: 0.2))
        data.append(IngredientClass(ingredientName: "Rice, white", ingredientIcon: "rice", emissionsPerKg: 2.3589434, standardPortionName: "cup", standardPortionSizeKg: 0.2))
        data.append(IngredientClass(ingredientName: "Rice, wild , brown", ingredientIcon: "", emissionsPerKg: 11.1553772, standardPortionName: "cup", standardPortionSizeKg: 0.2))
        data.append(IngredientClass(ingredientName: "Rice, wild, white", ingredientIcon: "", emissionsPerKg: 12.1474562, standardPortionName: "cup", standardPortionSizeKg: 0.2))
        data.append(IngredientClass(ingredientName: "Rye Grain", ingredientIcon: "", emissionsPerKg: 0.2425082, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Salmon", ingredientIcon: "fish", emissionsPerKg: 5.070626, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Salt", ingredientIcon: "salt", emissionsPerKg: 0.220462, standardPortionName: "tspn", standardPortionSizeKg: 0.005))
        data.append(IngredientClass(ingredientName: "Sausages", ingredientIcon: "", emissionsPerKg: 9.369635, standardPortionName: "each", standardPortionSizeKg: 0.08))
        data.append(IngredientClass(ingredientName: "Sea Bass", ingredientIcon: "fish", emissionsPerKg: 10.4278526, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Shrimp", ingredientIcon: "prawn", emissionsPerKg: 7.054784, standardPortionName: "each", standardPortionSizeKg: 0.006))
        data.append(IngredientClass(ingredientName: "Silver Carp", ingredientIcon: "fish", emissionsPerKg: 9.5680508, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Soft Drinks", ingredientIcon: "", emissionsPerKg: 1.7196036, standardPortionName: "can", standardPortionSizeKg: 0.35))
        data.append(IngredientClass(ingredientName: "Sorghum", ingredientIcon: "", emissionsPerKg: 0.2866006, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Sour Cream", ingredientIcon: "milk-1", emissionsPerKg: 0.220462, standardPortionName: "tbsp", standardPortionSizeKg: 0.02))
        data.append(IngredientClass(ingredientName: "Soybean Meal", ingredientIcon: "", emissionsPerKg: 0.661386, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Soybean Oil", ingredientIcon: "olive-oil", emissionsPerKg: 1.4770954, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Soybeans", ingredientIcon: "beans", emissionsPerKg: 0.551155, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Soymilk", ingredientIcon: "milk-1", emissionsPerKg: 0.6834322, standardPortionName: "glass", standardPortionSizeKg: 0.25))
        data.append(IngredientClass(ingredientName: "Spaghetti", ingredientIcon: "pasta", emissionsPerKg: 1.2345872, standardPortionName: "serving", standardPortionSizeKg: 0.125))
        data.append(IngredientClass(ingredientName: "Spaghetti, whole wheat", ingredientIcon: "pasta", emissionsPerKg: 1.0582176, standardPortionName: "serving", standardPortionSizeKg: 0.125))
        data.append(IngredientClass(ingredientName: "Spinach", ingredientIcon: "lettuce", emissionsPerKg: 0.330693, standardPortionName: "bunch", standardPortionSizeKg: 0.25))
        data.append(IngredientClass(ingredientName: "Squash", ingredientIcon: "", emissionsPerKg: 0.3527392, standardPortionName: "each", standardPortionSizeKg: 1.3))
        data.append(IngredientClass(ingredientName: "Strawberries", ingredientIcon: "strawberry", emissionsPerKg: 0.2645544, standardPortionName: "each", standardPortionSizeKg: 0.012))
        data.append(IngredientClass(ingredientName: "Sugar", ingredientIcon: "", emissionsPerKg: 3.9462698, standardPortionName: "tspn", standardPortionSizeKg: 0.004))
        data.append(IngredientClass(ingredientName: "Sugar, raw", ingredientIcon: "", emissionsPerKg: 3.0203294, standardPortionName: "tspn", standardPortionSizeKg: 0.004))
        data.append(IngredientClass(ingredientName: "Sugarbeets", ingredientIcon: "", emissionsPerKg: 0.0440924, standardPortionName: "each", standardPortionSizeKg: 0.75))
        data.append(IngredientClass(ingredientName: "Sugarcane", ingredientIcon: "", emissionsPerKg: 0.0440924, standardPortionName: "stalks", standardPortionSizeKg: 1.4))
        data.append(IngredientClass(ingredientName: "Sunflower Oil", ingredientIcon: "olive-oil", emissionsPerKg: 1.4770954, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Sunflower Seed", ingredientIcon: "", emissionsPerKg: 0.881848, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Sweet Corn", ingredientIcon: "", emissionsPerKg: 0.3527392, standardPortionName: "cob", standardPortionSizeKg: 0.2))
        data.append(IngredientClass(ingredientName: "Sweet Potatoes", ingredientIcon: "", emissionsPerKg: 0.4188778, standardPortionName: "each", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Tilapia", ingredientIcon: "fish", emissionsPerKg: 10.5601298, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Tofu", ingredientIcon: "", emissionsPerKg: 0.7054784, standardPortionName: "packet", standardPortionSizeKg: 0.25))
        data.append(IngredientClass(ingredientName: "Tomato Paste", ingredientIcon: "tomato", emissionsPerKg: 1.8298346, standardPortionName: "tbsp", standardPortionSizeKg: 0.017))
        data.append(IngredientClass(ingredientName: "Tomato Sauce", ingredientIcon: "", emissionsPerKg: 2.2487124, standardPortionName: "each", standardPortionSizeKg: 0.35))
        data.append(IngredientClass(ingredientName: "Tomatoes", ingredientIcon: "tomato", emissionsPerKg: 0.2425082, standardPortionName: "each", standardPortionSizeKg: 0.12))
        data.append(IngredientClass(ingredientName: "Tomatoes, Cherry", ingredientIcon: "tomato", emissionsPerKg: 0.0661386, standardPortionName: "each", standardPortionSizeKg: 0.017))
        data.append(IngredientClass(ingredientName: "Trout", ingredientIcon: "fish", emissionsPerKg: 4.4312862, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Tuna", ingredientIcon: "fish", emissionsPerKg: 3.4392072, standardPortionName: "fillet", standardPortionSizeKg: 0.17))
        data.append(IngredientClass(ingredientName: "Tuna, canned", ingredientIcon: "tuna", emissionsPerKg: 4.078547, standardPortionName: "can", standardPortionSizeKg: 0.09))
        data.append(IngredientClass(ingredientName: "Turkey", ingredientIcon: "roast-chicken", emissionsPerKg: 4.6737944, standardPortionName: "breast", standardPortionSizeKg: 2.7))
        data.append(IngredientClass(ingredientName: "Vegetable Oil", ingredientIcon: "olive-oil", emissionsPerKg: 1.7857422, standardPortionName: "tbsp", standardPortionSizeKg: 0.015))
        data.append(IngredientClass(ingredientName: "Walnuts", ingredientIcon: "", emissionsPerKg: 0.771617, standardPortionName: "each", standardPortionSizeKg: 0.02))
        data.append(IngredientClass(ingredientName: "Wheat", ingredientIcon: "", emissionsPerKg: 0.3527392, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Wheat Bran", ingredientIcon: "", emissionsPerKg: 0.551155, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Wheat Germ", ingredientIcon: "", emissionsPerKg: 0.551155, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Wheat, whole", ingredientIcon: "", emissionsPerKg: 0.551155, standardPortionName: "cup", standardPortionSizeKg: 0.15))
        data.append(IngredientClass(ingredientName: "Whey Powder", ingredientIcon: "", emissionsPerKg: 2.0282504, standardPortionName: "cup", standardPortionSizeKg: 0.05))
        data.append(IngredientClass(ingredientName: "Whipped Cream", ingredientIcon: "milk-1", emissionsPerKg: 0.1543234, standardPortionName: "tbsp", standardPortionSizeKg: 0.01))
        data.append(IngredientClass(ingredientName: "Wine", ingredientIcon: "", emissionsPerKg: 0.440924, standardPortionName: "glass", standardPortionSizeKg: 0.28))
        data.append(IngredientClass(ingredientName: "Yogurt", ingredientIcon: "yogurt", emissionsPerKg: 0.9038942, standardPortionName: "cup", standardPortionSizeKg: 0.245))
        
        return data
    }
}
