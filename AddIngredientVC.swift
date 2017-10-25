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
class AddIngredientVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    //MARK: - Properties

    @IBOutlet weak var addIngredientTableView: UITableView!
    
    @IBOutlet weak var customNav: UIView!
    //@IBOutlet weak var searchBarView: UIView!
    var recipe: Recipe?
    
    private let segueSelectIngredient = "SelectIngredientSegue"
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    //create an array to store the data and the filtered data
    var ingredientsArray = [IngredientClass]()
    var filteredIngredientsArray = [IngredientClass]()
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //set searchController properties
        searchController.hidesNavigationBarDuringPresentation = false
        let greyColor = UIColor(red:0.97, green:0.95, blue:0.95, alpha:1.0)
        let darkGreyColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        searchController.searchBar.barTintColor = greyColor
        searchController.searchBar.tintColor = darkGreyColor
        //searchController.searchBar.backgroundImage = UIImage()
        searchController.searchBar.backgroundImage = UIImage(named: "searchBarBackground")
        //searchbar height changed from 44 to 64 pixels
//        let screenSize: CGRect = UIScreen.main.bounds
//        if #available(iOS 11.0, *) {
//            searchBarView.frame = CGRect(x: 0, y: 70, width: screenSize.width, height: 64)
//        } else {
//            searchBarView.frame = CGRect(x: 0, y: 70, width: screenSize.width, height: 44)
//        }

        //set delegate and datasource as self
        addIngredientTableView.dataSource = self
        addIngredientTableView.delegate = self
       
        //get data from the IngredientData class containing ingredient data
        ingredientsArray = Data.getData()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        //searchBarView.addSubview(searchController.searchBar)
        //searchController.searchBar.sizeToFit()
        let searchControllerSubView = searchController.searchBar
        searchControllerSubView.frame = CGRect(x: 10, y: 10, width: customNav.frame.width, height: customNav.frame.height)
        customNav.addSubview(searchController.searchBar)
        //addIngredientTableView.tableHeaderView = searchController.searchBar
        
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
        //cell.ingredientImg.image = UIImage(named: ingredient.ingredientIcon)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        searchController.searchBar.endEditing(true)
    }
    
}

//MARK: - UISearchControllerUpdating

extension AddIngredientVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
//MARK: - Search Bar Delegate Functions
    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        self.search.endEditing(true)
//        searchbar
//    }
    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        self.addIngredientTableView.isScrollEnabled = false
//        self.searchBarView.endEditing(true)
//    }
//    
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        self.addIngredientTableView.isScrollEnabled = true
//    }
}
