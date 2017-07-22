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

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    //MARK: - Properties
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    //MARK: - Core Data Stack Properties
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set tableView delegate and datasource
        recipeTableView.delegate = self
        recipeTableView.delegate = self
    
    }

    //MARK: - Notification Handling
    
    //MARK: - Navigation
    
    //MARK: - Helper Methods
    
    //MARK: - Actions
    
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

