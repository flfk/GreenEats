//
//  SelectIngredientVC.swift
//  GreenEats
//
//  Created by Felix Kramer on 23/7/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//

import UIKit

class SelectIngredientVC: UIViewController {

    
    //MARK: - Properties
    
    @IBOutlet weak var ingredientImg: UIImageView!
    
    @IBOutlet weak var ingredientNameLbl: UILabel!
    
    @IBOutlet weak var ingredientQuantityPicker: UIPickerView!
    
    @IBOutlet weak var ingredientRatingImg: UIImageView!
    
    @IBOutlet weak var ingredientEmissionsLbl: UILabel!
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
