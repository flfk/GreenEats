//
//  AddIngredientSearchBar.swift
//  GreenEats
//
//  Created by Felix Kramer on 25/10/17.
//  Copyright © 2017 Felix Kramer. All rights reserved.
//

import UIKit

class AddIngredientSearchBar: UISearchBar {

    //MARK: - Propoerties
    
    var preferredFont: UIFont!
    
    var preferredTextColor: UIColor!
    
    //MARK: - Initialisation

    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)
        
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        
        searchBarStyle = UISearchBarStyle.prominent
        isTranslucent = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0]
        
        for i in 0...searchBarView.subviews.count {
            if searchBarView.subviews[i].isKind(of: UITextField.self) {
                index = i
                break
            }
        }
        
        return index
    }

    override func draw(_ rect: CGRect) {
        // Find the index of the search field in the search bar subviews.
        if let index = indexOfSearchFieldInSubviews() {
            // Access the search field
            let searchField: UITextField = (subviews[0] ).subviews[index] as! UITextField
            
            // Set its frame.
            searchField.frame = CGRect(x: 5.0, y: 5.0, width: frame.size.width - 10.0, height: frame.size.height - 10.0)
            
            // Set the font and text color of the search field.
            searchField.font = preferredFont
            searchField.textColor = preferredTextColor
            
            // Set the background color of the search field.
            searchField.backgroundColor = barTintColor
        }
        
        //create line at bottom of searchbar
        var startPoint = CGPoint(x: 0.0, y: frame.size.height)
        var endPoint = CGPoint(x: frame.size.width, y: frame.size.height)
        var path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        var shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = preferredTextColor.cgColor
        shapeLayer.lineWidth = 2.5
        
        layer.addSublayer(shapeLayer)
        
        super.draw(rect)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
