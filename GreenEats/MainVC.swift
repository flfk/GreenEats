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
    
    var newRecipe: Recipe?
    
    private let segueEditRecipe = "EditRecipeSegue"
    
    let segmentSortChoice = 0
    
    //Side Menu Properties
    
    @IBOutlet weak var sideMenu: UIView!
    @IBOutlet weak var sideMenuLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var closeSideMenuBtnLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var closeSideMenuBtn: UIButton!
    
    var menuShowing = false
    
    //Table view sorting button properties
    
    @IBOutlet weak var lowToHighBtn: UIButton!
    @IBOutlet weak var aToZBtn: UIButton!
    
    //MARK: - Core Data Stack Properties
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Recipe> = {
        
        //create fetch request
        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        
        //configure fetch request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "emissions", ascending: true)]
        
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
        
        //hide navigation controller top bar
        self.navigationController?.navigationBar.isHidden = true
        
        //attempt to fetch the data
        attemptFetch()
        
        //setUp the user interface
        self.setupView()
        
        //set tableView delegate and datasource
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)

        //ensure additional menu bar button item in original form
        //additionalMenuBtn.image = UIImage(named: "additionalMenuSmall")?.withRenderingMode(.alwaysOriginal)
    }
    
    //MARK: - View Will Appear
    
    override func viewWillAppear(_ animated: Bool) {
        //add view controller as an observer so that when the app enters the background data is saved
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidEnterBackground(_:)), name: Notification.Name.UIApplicationDidEnterBackground, object: nil)
        
        //set side menu constraints and properties
        sideMenuLeadingConstraint.constant = -230
        sideMenu.layer.shadowOpacity = 0.8
        closeSideMenuBtnLeadingConstraint.constant = -550
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? AddRecipeVC else { return }
        
        if let indexPath = recipeTableView.indexPathForSelectedRow, segue.identifier == segueEditRecipe {
            let recipe = fetchedResultsController.object(at: indexPath as IndexPath)
            destinationViewController.recipe = recipe
            recipeTableView.deselectRow(at: indexPath, animated: true)
            //ensure that recipe not deleted
            destinationViewController.deleteRecipeBackBtn = false
            destinationViewController.servingSize = recipe.servings
            //mark recipe state to setup UI
            destinationViewController.newRecipe = false
        } else {
            //create the recipe data instance
            let newRecipe = Recipe(context: adManagedObjectContext)
            //configure the newRecipe creation date
            newRecipe.createdAt = "\(Date())"
            newRecipe.rating = "1 - "
            //send the new recipe to the AddRecipe view controller
            destinationViewController.recipe = newRecipe
            destinationViewController.servingSize = 1
            //if back button pressed delete recipe
            destinationViewController.deleteRecipeBackBtn = true
            //mark recipe state to setup UI
            destinationViewController.newRecipe = true
        }
        
       
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
    
    //MARK: - Actions
    
    @IBAction func sortLowToHighBtn(_ sender: Any) {
        
        //change button text colors
        let selectedColor = UIColor(red:0.42, green:0.82, blue:0.52, alpha:1.0)
        let deselectedColor = UIColor(red:0.79, green:0.79, blue:0.81, alpha:1.0)
        lowToHighBtn.setTitleColor(selectedColor, for: .normal)
        aToZBtn.setTitleColor(deselectedColor, for: .normal)
        
        //sort tableview
        self.fetchedResultsController.fetchRequest.sortDescriptors = nil
        fetchedResultsController.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "emissions", ascending: false)]
        self.fetchedResultsController.fetchRequest.sortDescriptors = nil
        attemptFetch()
        updateView()
        
    }
    
    @IBAction func sortAToZBtn(_ sender: Any) {
        
        //change button text colors
        let selectedColor = UIColor(red:0.42, green:0.82, blue:0.52, alpha:1.0)
        let deselectedColor = UIColor(red:0.79, green:0.79, blue:0.81, alpha:1.0)
        lowToHighBtn.setTitleColor(deselectedColor, for: .normal)
        aToZBtn.setTitleColor(selectedColor, for: .normal)
        
        //sort tableview
        self.fetchedResultsController.fetchRequest.sortDescriptors = nil
        fetchedResultsController.fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        attemptFetch()
        updateView()
    }
    
    

    
    
    @IBAction func selectSideMenu(_ sender: Any) {
        
        sideMenuLeadingConstraint.constant = 0
        self.navigationController?.navigationBar.layer.zPosition = -3
        
        //animate side menu
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        
        closeSideMenuBtnLeadingConstraint.constant = 0
    }
    
    @IBAction func closeSideMenuBtn(_ sender: Any) {
        
        sideMenuLeadingConstraint.constant = -230
        
        
        //animate side menu
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        
        closeSideMenuBtnLeadingConstraint.constant = -550
        
        self.navigationController?.navigationBar.layer.zPosition = 0
        
    }
    
    
    
    
    //MARK: - Helper Methods
    
    //UpdateView updates the user interface
    fileprivate func updateView() {

        var hasRecipes = false
        
        if let recipes = fetchedResultsController.fetchedObjects {
            hasRecipes = recipes.count > 0

        }
        
        
        recipeTableView.isHidden = !hasRecipes
        
        recipeTableView.reloadData()
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
        
        //fetch recipe
        let recipe = fetchedResultsController.object(at: indexPath as IndexPath)
        
        //configure cell contents
        cell.recipeNameLbl.text = recipe.name
        cell.recipeEmmissionsLbl.text = "\(Int(recipe.emissions))"
        //let imageName = recipe.rating! + "Small"
        //cell.recipeEmojiImg.image = UIImage(named: imageName)
        
        //Set label to auto-adjust for longer names with mininum size of 12
        cell.recipeNameLbl.adjustsFontSizeToFitWidth = true
        cell.recipeNameLbl.minimumScaleFactor = 0.7
        cell.recipeEmmissionsLbl.adjustsFontSizeToFitWidth = true
        cell.recipeEmmissionsLbl.minimumScaleFactor = 0.7
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
        guard let recipes = fetchedResultsController.fetchedObjects else { return 0 }
        
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = recipeTableView.dequeueReusableCell(withIdentifier: RecipeCell.reuseIdentifier, for: indexPath) as? RecipeCell
            else {
                fatalError("Unexpected Index Path")
        }
        
        configureRecipeCell(cell, at: indexPath)
        
        return cell
    }
    
    //editing style enables the row to be deleted
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            //fetch recipe
            let recipe = fetchedResultsController.object(at: indexPath)
            
            //delete recipe
            recipe.managedObjectContext?.delete(recipe)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //MARK: - NS Fetched Results Controller Delegate Functions

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        recipeTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        recipeTableView.endUpdates()
        
        updateView()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                recipeTableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        case .delete:
            if let indexPath = indexPath {
                recipeTableView.deleteRows(at: [indexPath], with: .fade)
            }
        case.update:
            if let indexPath = indexPath, let cell = recipeTableView.cellForRow(at: indexPath) as? RecipeCell {
                configureRecipeCell(cell, at: indexPath)
            }
        case.move:
            if let indexPath = indexPath {
                recipeTableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let newIndexPath = newIndexPath {
                recipeTableView.insertRows(at: [newIndexPath], with: .fade)
            }
        }
    }
    
    
}

