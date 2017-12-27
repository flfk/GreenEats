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

//add protocols for tableview data source and delegate, NS fetched results controller delegate, Textfield delegate
class AddRecipeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, UITextFieldDelegate {

    //MARK: - Properties
    
    @IBOutlet weak var recipeNameTxtFld: UITextField!
    @IBOutlet weak var servingSizeLbl: UILabel!
    @IBOutlet weak var recipeRatingImg: UIImageView!
    @IBOutlet weak var recipeEmissionsLbl: UILabel!
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    @IBOutlet weak var saveRecipeBtn: UIButton!
    @IBOutlet weak var navBarLbl: UILabel!
    @IBOutlet weak var trashBtn: UIButton!
    
    var servingSize: Double?
    var recipe: Recipe?
    var newRecipe: Bool?
    
    
    //test if view controller popped due to recipe being abandoned
    var deleteRecipeBackBtn: Bool?
    
    private let segueAddIngredient = "AddIngredientSegue"
    private let segueEditIngredient = "EditIngredientSegue"
    
    //MARK: - Core Data Stack Properties
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Ingredient> = {
        
        //create fetch request
        let fetchRequest: NSFetchRequest<Ingredient> = Ingredient.fetchRequest()
        
        //configure fetch request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "emissions", ascending: false)]
        
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
        
        //hide navigation controller top bar
        self.navigationController?.navigationBar.isHidden = true

        //attempt to fetch the data
        attemptFetch()
        
        //setUp the user interface
        self.setupView()
        
        //set tableView delegate and datasource
        ingredientsTableView.dataSource = self
        ingredientsTableView.delegate = self
        
        //set the textfield delegate
        recipeNameTxtFld.delegate = self
        // set recipeName textfield
        recipeNameTxtFld.text = recipe?.name
        
        //Set textfield and label font sizes to auto-adjust for longer names with mininum size of 12
        recipeNameTxtFld.adjustsFontSizeToFitWidth = true
        recipeNameTxtFld.minimumFontSize = 12
        
        //set the serving size label
        let roundedServingSize = Int(servingSize!)
        servingSizeLbl.text = "\(roundedServingSize)"
        
        //set up UI
        if newRecipe! {
            navBarLbl.text = "Add Recipe"
            saveRecipeBtn.isHidden = false
            trashBtn.isHidden = true
            
        } else {
            navBarLbl.text = "Edit Recipe"
            saveRecipeBtn.isHidden = true
            trashBtn.isHidden = false
        }
        
        //add view controller as an observer so that when the app enters the background data is saved
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidEnterBackground(_:)), name: Notification.Name.UIApplicationDidEnterBackground, object: nil)
        
        //add a textfield observer so you know when the name is edited
        recipeNameTxtFld.addTarget(self, action: "textFieldDidChange", for: UIControlEvents.editingChanged)
        
        
    }
    
    //MARK: - View will dissapear
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController && deleteRecipeBackBtn! {
            //delete recipe
            recipe?.managedObjectContext?.delete(recipe!)
        }
        
    }
    
    //MARK: - Actions
    
    @IBAction func closeVC(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func minusServingBtn(_ sender: Any) {
        
        if servingSize == 1 {
            return
        } else {
            servingSize = servingSize! - 1
            let roundedServingSize = Int(servingSize!)
            servingSizeLbl.text = "\(roundedServingSize)"
            
            //update the recipe data
            recipe?.servings = servingSize!
            
            updateView()
        }
        
        
    }

    @IBAction func plusServingBtn(_ sender: Any) {
        
        if servingSize == 19 {
            return
        } else {
            servingSize = servingSize! + 1
            let roundedServingSize = Int(servingSize!)
            servingSizeLbl.text = "\(roundedServingSize)"
            
            //update the recipe data
            recipe?.servings = servingSize!
            
            updateView()
        }
        
    }
    
    @IBAction func saveRecipeBtn(_ sender: Any) {
        
        //test if recipe name textfield is empty
        if recipeNameTxtFld.text != "" {
            
            //test if recipe has ingredients
            var hasIngredients = false
            
            if let ingredients = recipe?.ingredients {
                hasIngredients = ingredients.count > 0
            }
            
            if hasIngredients {
                //configure recipe
                recipe?.name = recipeNameTxtFld.text
                recipe?.emissions = calculateRecipeEmissions()
                recipe?.servings = servingSize!
                recipe?.rating = calculateRecipeRating()
                
                //indicate recipe not abandoned and should be saved
                deleteRecipeBackBtn = false
                
                //Pop view controller
                _ = navigationController?.popViewController(animated: true)
            } else {
                unableToSaveAlert(title: "", message: "Don't forget to add some ingredients")
            }
            

        } else {
            unableToSaveAlert(title: "", message: "Don't forget to name your recipe")
        }
    
    }
    
    @IBAction func deleteRecipeBtn(_ sender: Any) {
        deleteRecipeAlert(title: "", message: "Are you sure you want to delete this recipe?")
    }
    


    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == segueAddIngredient {
            guard let destinationViewController = segue.destination as? AddIngredientVC else { return }
            destinationViewController.recipe = recipe
        } else if segue.identifier == segueEditIngredient {
            guard let destinationViewController = segue.destination as? SelectIngredientVC else { return }
            if let indexPath = ingredientsTableView.indexPathForSelectedRow {
                let ingredientToEdit = fetchedResultsController.object(at: indexPath as IndexPath)
                destinationViewController.ingredientToEdit = ingredientToEdit
                destinationViewController.recipe = recipe
                print("\(ingredientToEdit)")
            }
            
        }
        
        
    }
    
    //MARK: - Notification Handling
    
    //applicationDidEnterBackground is used to save the data when the application enters the background
    
    func applicationDidEnterBackground(_ notification: Notification) {
        
        //test if recipe name textfield is empty
        if recipeNameTxtFld.text != "" {
            do {
                try adManagedObjectContext.save()
            } catch {
                print("Unable to Save Changes")
                print("\(error), \(error.localizedDescription)")
            }
            
            print("Managed Object Context saved to persitent container")
        } 
    }
    
    //MARK: - Helper Methods
    
    //UpdateView updates the user interface
    fileprivate func updateView() {
        
        //hide tableView if no ingredients added
        var hasIngredients = false
        
        if let ingredients = recipe?.ingredients {
            hasIngredients = ingredients.count > 0
        }
        
        ingredientsTableView.isHidden = !hasIngredients
        
        //update the emissions label and image
        let roundedRecipeEmissions = Int(calculateRecipeEmissions())
        recipeEmissionsLbl.text = "\(roundedRecipeEmissions)"
        let imageName = calculateRecipeRating() + "Large"
        recipeRatingImg.image = UIImage(named: imageName)
        
        
        
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
        
        //fetch ingredient
        let ingredient = fetchedResultsController.object(at: indexPath as IndexPath)
        
        //configure cell contents
        cell.ingredientNameLbl.text = ingredient.name
        let roundedIngredientQuantity = Int(ingredient.quantity)
        cell.ingredientQuantityLbl.text = "\(roundedIngredientQuantity)" + " " + "\(ingredient.quantityName!)"
        let roundedEmissions = Int(ingredient.emissions)
        cell.ingredientEmissionsLbl.text = "\(roundedEmissions)"
        //cell.ingredientImg.image = UIImage(named: ingredient.icon!)
        
        //Set label to auto-adjust for longer names with mininum size of 12
        cell.ingredientNameLbl.adjustsFontSizeToFitWidth = true
        cell.ingredientNameLbl.minimumScaleFactor = 0.7
        cell.ingredientEmissionsLbl.adjustsFontSizeToFitWidth = true
        cell.ingredientEmissionsLbl.minimumScaleFactor = 0.7
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
    
    fileprivate func calculateRecipeEmissions() -> Double {
        
        var recipeEmissions = 0.00
        
        let ingredientEmissions = recipe?.ingredients as! Set<Ingredient>
        
        for i in ingredientEmissions {
            recipeEmissions = recipeEmissions + i.emissions
                
        }
        
        let emissionsPerServe = recipeEmissions / servingSize!
        
        //update the recipe total emissions
        recipe?.emissions = emissionsPerServe
        
        return emissionsPerServe
    }
    
    func calculateRecipeRating() -> String {
        var recipeRating = ""
        
        let recipeEmissions = calculateRecipeEmissions()
        
        
        //rating based on servings of beef/lamb, chicken, vegetarian
        if recipeEmissions < 1000 {
          recipeRating = "1 - "
        } else if recipeEmissions < 1500 {
            recipeRating = "2 - "
        } else if recipeEmissions < 3000 {
            recipeRating = "3 - "
        } else if recipeEmissions < 4000 {
            recipeRating = "4 - "
        } else {
            recipeRating = "5 - "
        }
        
        //update the recipe data
        recipe?.rating = recipeRating
        
        return recipeRating
    }
    
    func unableToSaveAlert (title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in alert.dismiss(animated: true, completion: nil)} ))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func deleteRecipeAlert (title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive, handler: { action in alert.dismiss(animated: true, completion: nil)
            
            self.recipe?.managedObjectContext?.delete(self.recipe!)
            self.navigationController?.popViewController(animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { action in alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //call this method when the text field observer notices changes to update the recipe name data
    func textFieldDidChange() {
        recipe?.name = recipeNameTxtFld.text
    }
    
    //MARK: - Table View DataSource Protocol Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        guard let ingredients = recipe?.ingredients else { return 0 }
        
        return ingredients.count
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = ingredientsTableView.dequeueReusableCell(withIdentifier: SelectedIngredientCell.reuseIdentifier, for: indexPath) as? SelectedIngredientCell
            else {
                fatalError("Unexpected Index Path")
        }
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ingredientsTableView.deselectRow(at: indexPath, animated: true)
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
    
    //MARK: - Text Field Delegate Functions
    
    //hide keyboard when the user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        recipeNameTxtFld.resignFirstResponder()
        return true
    }
    
}
