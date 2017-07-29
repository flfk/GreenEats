//
//  AddIngredientVC.swift
//  GreenEats
//
//  Created by Felix Kramer on 23/7/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//

import UIKit
//import Core Data
import CoreData

//add protocols for tableview data source and delegate
class AddIngredientVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Properties
    
    @IBOutlet weak var ingredientSearchBar: UISearchBar!
    @IBOutlet weak var addIngredientTableView: UITableView!
    
    //create an array to store the data
    var ingredientsArray = [IngredientClass]()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set delegate and datasource as self
        addIngredientTableView.dataSource = self
        addIngredientTableView.delegate = self
       
        //get data from the IngredientData class containing ingredient data
        ingredientsArray = Data.getData()
        
    }

    //MARK: - Table View DataSource Protocol Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ingredientsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = addIngredientTableView.dequeueReusableCell(withIdentifier: AddIngredientCell.reuseIdentifier, for: indexPath) as? AddIngredientCell
            else {
                fatalError("Unexpected Index Path")
        }
        
        let ingredient = ingredientsArray[indexPath.row]
        
        cell.ingredientNameLbl.text = ingredient.ingredientName
        cell.ingredientImg.image = UIImage(named: ingredient.ingredientIcon)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
