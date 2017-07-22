//
//  MainVC.swift
//  GreenEats
//
//  Created by Felix Kramer on 22/7/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//
//  Backend based off tutorial from https://cocoacasts.com/populate-a-table-view-with-nsfetchedresultscontroller-and-swift-3/

import UIKit
//import Core Data
import CoreData

//add protocols for tableview data source and delegate, NS fetched results controller delegate
class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    //MARK: - Properties
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    //MARK: - Core Data Stack Properties
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Recipe> = {
        
        //create fetch request
        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        
        //configure fetch request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        //create fetch request controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: adManagedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        //configure fetch request controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    var managedObjectContext: NSManagedObjectContext?
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set tableView delegate and datasource
        recipeTableView.delegate = self
        recipeTableView.delegate = self
    
    }

    //MARK: - Notification Handling
    
    //MARK: - Navigation
    
    //MARK: - Actions
    
    //MARK: - Helper Methods
    
    //UpdateView updates the user interface
    fileprivate func updateView() {
        var hasRecipes = false
        
        if let recipes = fetchedResultsController.fetchedObjects {
            hasRecipes = recipes.count > 0
        }
        
        recipeTableView.isHidden = !hasRecipes
        print("Update View Function")
    }
    
    //if there are no recipes display setup label
    private func setupLabel() {
        
        //XX Placeholder if setup label / view / image to be added later (see evernote)
        
    }
    
    private func setupView() {
        setupLabel()
        
        updateView()
    }
    
    //configureRecipeCell updates the cell contents
    func configureRecipeCell(_ cell: RecipeCell, at indexPath: IndexPath) {
        
        //display status
        print("configuring recipe cell")
        
        //fetch recipe
        let recipe = fetchedResultsController.object(at: indexPath)
        
        //configure cell contents
        //XX PLACEHOLDER
        cell.recipeNameLbl.text = recipe.name
        cell.recipeEmmissionsLbl.text = "\(recipe.emissions)"
        cell.recipeEmojiImg.image = UIImage(named: recipe.rating!)
    }
    
    //attemptFetch fetches the data from the fetched results controller
    func attemptFetch() {
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
        
        updateView()
        
    }
    
    //MARK: - Table View DataSource Protocol Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Placeholder
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = recipeTableView.dequeueReusableCell(withIdentifier: RecipeCell.reuseIdentifier, for: indexPath) as? RecipeCell
            else {
                fatalError("Unexpected Index Path")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //MARK: - NS Fetched Results Controller Delegate Functions

    
}

