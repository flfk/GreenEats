//
//  RecipeCell.swift
//  GreenEats
//
//  Created by Felix Kramer on 22/7/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    //MARK: - Reuse Identifier
    
    static let reuseIdentifier = "RecipeCell"
    
    //MARK: - Properties
    
    @IBOutlet weak var recipeNameLbl: UILabel!
    @IBOutlet weak var recipeEmmissionsLbl: UILabel!
    @IBOutlet weak var recipeEmojiImg: UIImageView!
    
    //MARK: - Initialisation 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
