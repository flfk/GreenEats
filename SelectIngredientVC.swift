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
    
    var ingredient: IngredientClass?
    var ingredientToEdit: Ingredient?
    var recipe: Recipe?
    
    //set initial value of ingredient to 0
    var wholeNumbers:String?
    var fraction:String?
    var quantityType:String?
    
    //MARK: - Quantity Options
    
    var quantityOptionsArray = [[String]]()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set picker view delegate and datasource to self
        ingredientQuantityPicker.delegate = self
        ingredientQuantityPicker.dataSource = self
        
        setUpQuantityOptionsArray()
        
        //set up the views based on whether or not ingredient being added or edited
        if let ingredientToEdit = ingredientToEdit {
            ingredientNameLbl.text = ingredientToEdit.name
            ingredientImg.image = UIImage(named: ingredientToEdit.icon!)
            //prepopulate scroll view
            let pickerRowCompOne = Int(ingredientToEdit.pickerCompOneRow)
            let pickerRowCompTwo = Int(ingredientToEdit.pickerCompTwoRow)
            let pickerRowCompThree = Int(ingredientToEdit.pickerCompThreeRow)
            ingredientQuantityPicker.selectRow(pickerRowCompOne, inComponent: 0, animated: true)
            ingredientQuantityPicker.selectRow(pickerRowCompTwo, inComponent: 1, animated: true)
            ingredientQuantityPicker.selectRow(pickerRowCompThree, inComponent: 2, animated: true)
        } else {
            ingredientNameLbl.text = ingredient?.ingredientName
            ingredientImg.image = UIImage(named: (ingredient?.ingredientIcon)!)
        }
       
    }
    
    //MARK: - Actions
    
    @IBAction func closeVC(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func AddIngredientBtn(_ sender: Any) {
        
        //calculate quantitySelected, kgSelected and emissions in grams through helper methods
        let quantitySelected = selectedQuantity()
        let kgSelected = selectedKilograms()
        let gramsEmitted = calculateInEmissions()
        
        let quantityComponentRow = ingredientQuantityPicker.selectedRow(inComponent: 2)
        
        if ingredientToEdit == nil {
            if let ingredient = ingredient {
                //create ingredient instance
                let newIngredient = Ingredient(context: adManagedObjectContext)
                
                //configure ingredient
                //attributes that will not be editable
                newIngredient.name = ingredient.ingredientName
                newIngredient.icon = ingredient.ingredientIcon
                newIngredient.emissionsPerKg = ingredient.emissionsPerKg
                newIngredient.standardPortionName = ingredient.standardPortionName
                newIngredient.standardPortionSizeKg = ingredient.standardPortionSizeKg
                //attributes that are editable
                newIngredient.emissions = gramsEmitted
                newIngredient.kilograms = kgSelected
                newIngredient.quantityName = quantityOptionsArray[2][quantityComponentRow]
                newIngredient.quantity = quantitySelected
                //set rows of pickerView
                newIngredient.pickerCompOneRow = Int16(ingredientQuantityPicker.selectedRow(inComponent: 0))
                newIngredient.pickerCompTwoRow = Int16(ingredientQuantityPicker.selectedRow(inComponent: 1))
                newIngredient.pickerCompThreeRow = Int16(ingredientQuantityPicker.selectedRow(inComponent: 2))
                
                //set relationship
                newIngredient.recipe = recipe
                
                //pop view controller back 2 VCs to AddRecipe VC
                let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
                self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true);
            }
            
        }
        
        if let ingredientToEdit = ingredientToEdit {
            //configure ingredient
            ingredientToEdit.emissions = gramsEmitted
            ingredientToEdit.kilograms = kgSelected
            ingredientToEdit.quantityName = quantityOptionsArray[2][quantityComponentRow]
            ingredientToEdit.quantity = quantitySelected
            //set rows of pickerView
            ingredientToEdit.pickerCompOneRow = Int16(ingredientQuantityPicker.selectedRow(inComponent: 0))
            ingredientToEdit.pickerCompTwoRow = Int16(ingredientQuantityPicker.selectedRow(inComponent: 1))
            ingredientToEdit.pickerCompThreeRow = Int16(ingredientQuantityPicker.selectedRow(inComponent: 2))
            
            //pop view controller back 1 VC to AddRecipe VC
            let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
            self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true);
        }
        

        
    }
    
    
    //MARK: - Picker View Data Source and Delegate Protocol Functions
    
    //return the count of components required based on data array
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return quantityOptionsArray.count
    }
    
    //count the number of rows required per component based on data array
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      
        return quantityOptionsArray[component].count
        
    }
    
    //return the string for each required component row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return quantityOptionsArray[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //update the gramsEmittedLabel
        let gramsEmitted = calculateInEmissions()
        let roundedGramsEmitted = Int(gramsEmitted)
        ingredientEmissionsLbl.text = "\(roundedGramsEmitted)"
        let imageName = calculateIngredientRating() + "Large"
        ingredientRatingImg.image = UIImage(named: imageName)
        
        
    }
    
    //MARK: - Helper Methods
    
    fileprivate func selectedQuantity() -> Double {
        let integerSelected = Double(ingredientQuantityPicker.selectedRow(inComponent: 0))
        
        var fractionSelected = 0.00
        let rowFractionSelected = ingredientQuantityPicker.selectedRow(inComponent: 1)
        if rowFractionSelected == 0 {
            fractionSelected = 0.00
        } else if rowFractionSelected == 1 {
            fractionSelected = 1 / 4
        } else if rowFractionSelected == 2 {
            fractionSelected = 1 / 3
        } else if rowFractionSelected == 3 {
            fractionSelected = 1 / 2
        } else if rowFractionSelected == 4 {
            fractionSelected = 2 / 3
        } else if rowFractionSelected == 5 {
            fractionSelected = 3 / 4
        }
        
        let quantitySelected = integerSelected + fractionSelected
        
        return quantitySelected
    }
    
    fileprivate func selectedKilograms() -> Double {
        
        let quantitySelected = selectedQuantity()
        
        var kgSelected = 0.00
        
        let quantityComponentRow = ingredientQuantityPicker.selectedRow(inComponent: 2)
        if quantityComponentRow == 0 {
            //quantity selected
            if let ingredientToEdit = ingredientToEdit {
                kgSelected = ingredientToEdit.standardPortionSizeKg * quantitySelected
            } else {
                kgSelected = Double((ingredient?.standardPortionSizeKg)!) * quantitySelected
            }
            
        } else if quantityComponentRow == 1 {
            //grams selected
            kgSelected = quantitySelected / 1000
            
        } else {
            //kg selected
            kgSelected = quantitySelected
            
        }
        
        return kgSelected

    }
    
    fileprivate func calculateInEmissions() -> Double {
        
        let kgSelected = selectedKilograms()
        var emissionsInGrams = 0.00
        
        if let ingredientToEdit = ingredientToEdit {
            emissionsInGrams = kgSelected * ingredientToEdit.emissionsPerKg * 1000
        } else {
            emissionsInGrams = kgSelected * (ingredient?.emissionsPerKg)! * 1000
        }
        
        return emissionsInGrams
    }
    
    func calculateIngredientRating() -> String {
        var ingredientRating = ""
        
        let ingredientEmissions = calculateInEmissions()
        
        if ingredientEmissions < 1500 {
            ingredientRating = "1 - "
        } else if ingredientEmissions < 3000 {
            ingredientRating = "2 - "
        } else if ingredientEmissions < 5000 {
            ingredientRating = "3 - "
        } else if ingredientEmissions < 8000 {
            ingredientRating = "4 - "
        } else {
            ingredientRating = "5 - "
        }
        
        return ingredientRating
        
    }
    
    fileprivate func setUpQuantityOptionsArray() {
        
        let integerRange = ["0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100", "110", "120", "130", "140", "150", "160", "170", "180", "190", "200", "210", "220", "230", "240", "250", "260", "270", "280", "290", "300", "310", "320", "330", "340", "350", "360", "370", "380", "390", "400", "410", "420", "430", "440", "450", "460", "470", "480", "490", "500", "510", "520", "530", "540", "550", "560", "570", "580", "590", "600", "610", "620", "630", "640", "650", "660", "670", "680", "690", "700", "710", "720", "730", "740", "750", "760", "770", "780", "790", "800", "810", "820", "830", "840", "850", "860", "870", "880", "890", "900", "910", "920", "930", "940", "950", "960", "970", "980", "990", "1000"]
        
        let fractionRange = ["0","1/4","1/3","1/2","2/3","3/4"]
        
        if let ingredientToEdit = ingredientToEdit {
            quantityOptionsArray = [
                integerRange, fractionRange, [ingredientToEdit.standardPortionName!,"grams","kilograms"]
            ]
        } else {
            quantityOptionsArray = [
                integerRange, fractionRange, [(ingredient?.standardPortionName)!,"grams","kilograms"]
            ]
        }
        
        
        
        
    }

}
