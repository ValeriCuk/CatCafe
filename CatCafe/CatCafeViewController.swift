//
//  ViewController.swift
//  CatCafe
//
//  Created by Lera Cuk on 08.11.2023.
//

import UIKit

class CatCafeViewController: UIViewController {

    @IBOutlet weak var titleUILable: UILabel!
    @IBOutlet weak var menuUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavTitle()
        addButtonApparance()
    }
    
    private func addNavTitle() {
        navigationItem.title = "Cat Cafe"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 119/255, green: 55/255, blue: 151/255, alpha: 1)
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func addButtonApparance(){
        menuUIButton.layer.cornerRadius = 26
        menuUIButton.layer.borderWidth = 1
        menuUIButton.layer.masksToBounds = true
        menuUIButton.layer.borderColor = UIColor.gray.cgColor
    }
}

