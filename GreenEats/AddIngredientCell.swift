//
//  AddIngredientCell.swift
//  GreenEats
//
//  Created by Felix Kramer on 23/7/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//

import UIKit

class AddIngredientCell: UITableViewCell {

    //MARK: - Reuse Identifier
    
    static let reuseIdentifier = "AddIngredientCell"
    
    //MARK: - Properties
    
    @IBOutlet weak var ingredientImg: UIImageView!
    @IBOutlet weak var ingredientNameLbl: UILabel!
    
    //MARK: - Initialisation
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
