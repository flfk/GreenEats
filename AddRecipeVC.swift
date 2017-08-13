//
//  AddRecipeVC.swift
//  GreenEats
//
//  Created by Felix Kramer on 23/7/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//

import UIKit
//import Core Data
import CoreData

//add protocols for tableview data source and delegate, NS fetched results controller delegate
class AddRecipeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    //MARK: - Properties
    
    @IBOutlet weak var recipeNameLbl: UILabel!
    @IBOutlet weak var servingSizeLbl: UILabel!
    @IBOutlet weak var recipeRatingImg: UIImageView!
    @IBOutlet weak var recipeEmissionsLbl: UILabel!
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    var servingSize = 1
    
    var recipe: Recipe?
    
    //MARK: - Core Data Stack Properties
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Ingredient> = {
        
        //create fetch request
        let fetchRequest: NSFetchRequest<Ingredient> = Ingredient.fetchRequest()
        
        //configure fetch request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        //predicate fetch request for project
        fetchRequest.predicate = NSPredicate(format: "recipe.createdAt == %@", self.recipe!.createdAt!)
        
        //create fetch request controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: adManagedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        //configure fetch request controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //attempt to fetch the data
        attemptFetch()
        
        //setUp the user interface
        self.setupView()
        
        //set tableView delegate and datasource
        ingredientsTableView.delegate = self
        ingredientsTableView.delegate = self
        
        //add view controller as an observer so that when the app enters the background data is saved
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidEnterBackground(_:)), name: Notification.Name.UIApplicationDidEnterBackground, object: nil)
        
        //set the serving size label
        servingSizeLbl.text = "\(servingSize)"
        
        //TEST recipe passsed through segue
        print(recipe?.createdAt)
        
        let ingredients = recipe?.ingredients
        //TEST
        print("ingredients count is" + "\(ingredients?.count)")
        
    }
    
    //MARK: - Actions

    @IBAction func minusServingBtn(_ sender: Any) {
        
        if servingSize == 1 {
            return
        } else {
            servingSize = servingSize - 1
            servingSizeLbl.text = "\(servingSize)"
        }
    }

    @IBAction func plusServingBtn(_ sender: Any) {
        servingSize = servingSize + 1
        servingSizeLbl.text = "\(servingSize)"
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? AddIngredientVC else { return }
        destinationViewController.recipe = recipe
        
        //destinationViewController = recipe
        
    }
    
    //MARK: - Notification Handling
    
    //applicationDidEnterBackground is used to save the data when the application enters the background
    
    func applicationDidEnterBackground(_ notification: Notification) {
        do {
            try adManagedObjectContext.save()
        } catch {
            print("Unable to Save Changes")
            print("\(error), \(error.localizedDescription)")
        }
        
        print("Managed Object Context saved to persitent container")
    }
    
    //MARK: - Helper Methods
    
    //UpdateView updates the user interface
    fileprivate func updateView() {
        var hasIngredients = false
        
        if let ingredients = recipe?.ingredients {
            hasIngredients = ingredients.count > 0
        }
        
        ingredientsTableView.isHidden = !hasIngredients
        print("Update View Function - Ingredients Table View")
    }
    
    //if there are no ingredients display setup label
    private func setupLabel() {
        
        //XX Placeholder if setup label / view / image to be added later (see evernote)
        
    }
    
    private func setupView() {
        setupLabel()
        
        updateView()
    }
    
    //configureIngredientCell updates the cell contents
    func configureIngredientCell(_ cell: SelectedIngredientCell, at indexPath: IndexPath) {
        
        //display status
        print("configuring selected ingredients cell")
        
        //fetch ingredient
        let ingredient = fetchedResultsController.object(at: indexPath as IndexPath)
        
        //configure cell contents
        //XX PLACEHOLDER
        cell.ingredientNameLbl.text = ingredient.name
        cell.ingredientQuantityLbl.text = ingredient.quantity
        cell.ingredientEmissionsLbl.text = "\(ingredient.emissions)"
        cell.ingredientImg.image = UIImage(named: ingredient.icon!)
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
       
        guard let ingredients = recipe?.ingredients else { return 0 }
        
        //TEST
        print("ingredients count is" + "\(ingredients.count)")
        
        return ingredients.count
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = ingredientsTableView.dequeueReusableCell(withIdentifier: SelectedIngredientCell.reuseIdentifier, for: indexPath) as? SelectedIngredientCell
            else {
                fatalError("Unexpected Index Path")
        }
        
        print("Configure cell should be called in cell for row at")
        configureIngredientCell(cell, at: indexPath)
        
        return cell
    }
    
    //editing style enables the row to be deleted
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            //fetch ingredient
            let ingredient = fetchedResultsController.object(at: indexPath)
            
            //delete ingredient
            ingredient.managedObjectContext?.delete(ingredient)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //MARK: - NS Fetched Results Controller Delegate Functions
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        ingredientsTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        ingredientsTableView.endUpdates()
        
        updateView()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                ingredientsTableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        case .delete:
            if let indexPath = indexPath {
                ingredientsTableView.deleteRows(at: [indexPath], with: .fade)
            }
        case.update:
            if let indexPath = indexPath, let cell = ingredientsTableView.cellForRow(at: indexPath) as? SelectedIngredientCell {
                configureIngredientCell(cell, at: indexPath)
            }
        case.move:
            if let indexPath = indexPath {
                ingredientsTableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let newIndexPath = newIndexPath {
                ingredientsTableView.insertRows(at: [newIndexPath], with: .fade)
            }
        }
    }

}
