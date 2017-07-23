//
//  SelectedIngredientCell.swift
//  GreenEats
//
//  Created by Felix Kramer on 23/7/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//

import UIKit

class SelectedIngredientCell: UITableViewCell {

    //MARK: - Properties
    
    @IBOutlet weak var ingredientImg: UIImageView!
    @IBOutlet weak var ingredientNameLbl: UILabel!
    @IBOutlet weak var ingredientQuantityLbl: UILabel!
    @IBOutlet weak var ingredientEmissionsLbl: UILabel!
    
    //MARK: - Initialisation
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
