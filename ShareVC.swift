//
//  ShareVC.swift
//  GreenEats
//
//  Created by Felix Kramer on 2/9/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//

import UIKit

class ShareVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    //MARK: - Actions
    
    @IBAction func closeVC(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
