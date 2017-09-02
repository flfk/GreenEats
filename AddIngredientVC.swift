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

    @IBOutlet weak var addIngredientTableView: UITableView!
    
    var recipe: Recipe?
    
    private let segueSelectIngredient = "SelectIngredientSegue"
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    //create an array to store the data and the filtered data
    var ingredientsArray = [IngredientClass]()
    var filteredIngredientsArray = [IngredientClass]()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hide navigation controller top bar
        self.navigationController?.navigationBar.isHidden = true

        //set delegate and datasource as self
        addIngredientTableView.dataSource = self
        addIngredientTableView.delegate = self
       
        //get data from the IngredientData class containing ingredient data
        ingredientsArray = Data.getData()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        addIngredientTableView.tableHeaderView = searchController.searchBar

        
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? SelectIngredientVC else {return}
        
        //pass the ingredient at the selected row to the SelectIngredientVC
        let indexPath = addIngredientTableView.indexPathForSelectedRow!
        
        var ingredients = [IngredientClass]()
        if isFiltering() {
            ingredients = filteredIngredientsArray
        } else {
            ingredients = ingredientsArray
        }
        let ingredient = ingredients[indexPath.row]
        destinationViewController.ingredient = ingredient
        destinationViewController.recipe = recipe
        
        addIngredientTableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: - Actions
    
    @IBAction func closeVC(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helper Methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        filteredIngredientsArray = ingredientsArray.filter({( ingredient: IngredientClass) -> Bool in
            return ingredient.ingredientName.lowercased().contains(searchText.lowercased())
        })
        addIngredientTableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    //MARK: - Table View DataSource Protocol Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering() {
            return filteredIngredientsArray.count
        }
        
        return ingredientsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = addIngredientTableView.dequeueReusableCell(withIdentifier: AddIngredientCell.reuseIdentifier, for: indexPath) as? AddIngredientCell
            else {
                fatalError("Unexpected Index Path")
        }
        let ingredient: IngredientClass
        
        if isFiltering() {
            ingredient = filteredIngredientsArray[indexPath.row]
        } else {
            ingredient = ingredientsArray[indexPath.row]
        }
        
        cell.ingredientNameLbl.text = ingredient.ingredientName
        cell.ingredientImg.image = UIImage(named: ingredient.ingredientIcon)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

//MARK: - UISearchControllerUpdating

extension AddIngredientVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
}
