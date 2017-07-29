//
//  SelectIngredientVC.swift
//  GreenEats
//
//  Created by Felix Kramer on 23/7/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//

import UIKit

class SelectIngredientVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    //MARK: - Properties
    
    @IBOutlet weak var ingredientImg: UIImageView!
    
    @IBOutlet weak var ingredientNameLbl: UILabel!
    
    @IBOutlet weak var ingredientQuantityPicker: UIPickerView!
    
    @IBOutlet weak var ingredientRatingImg: UIImageView!
    
    @IBOutlet weak var ingredientEmissionsLbl: UILabel!
    
    //set initial value of ingredient to 0
    var wholeNumbers:String?
    var fraction:String?
    var quantityType:String?
    
    //MARK: - Placeholder Quantity Data
    
    let placeholderQuantity = [
        [1,2,3,4,5,6],
        [0,1/4,1/2,3/4],
        ["each","grams"]
    ]
    
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set picker view delegate and datasource to self
        ingredientQuantityPicker.delegate = self
        ingredientQuantityPicker.dataSource = self

       
    }
    
    //MARK: - Picker View Data Source and Delegate Protocol Functions
    
    
    //----------CHECK OUT THIS TUTORIAL https://www.youtube.com/watch?v=cGLtaRLb64g ---------------------
    
    //return the count of components required based on data array
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return placeholderQuantity.count
    }
    
    //count the number of rows required per component based on data array
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      
        return placeholderQuantity[component].count
        
    }
    
    //return the string for each required component row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(placeholderQuantity[component][row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(component)")
        print("\(row)")
        
        //use a switch statement to identify component that was selected
        switch(component) {
        case 0:
            wholeNumbers = "\(placeholderQuantity[component][row])"
        case 1:
            fraction = "\(placeholderQuantity[component][row])"
        case 2:
            quantityType = "\(placeholderQuantity[component][row])"
        default:break
        }
    }

}
