//
//  MenuViewController.swift
//  CatCafe
//
//  Created by Lera Cuk on 08.11.2023.
//

import UIKit

class MenuViewController: UIViewController{
    
    @IBOutlet weak var burgersUIButton: UIButton!
    @IBOutlet weak var drinksUIButton: UIButton!
    @IBOutlet weak var dessertsUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBordersButtons()
    }
    
    private func addBordersButtons(){
        addApparanceButton(button: burgersUIButton)
        addApparanceButton(button: drinksUIButton)
        addApparanceButton(button: dessertsUIButton)
    }
    
    private func addApparanceButton(button: UIButton){
        button.layer.cornerRadius = 26
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.gray.cgColor
    }
}
