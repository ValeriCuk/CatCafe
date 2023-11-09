//
//  BurgersTableViewCell.swift
//  CatCafe
//
//  Created by Lera Cuk on 08.11.2023.
//

import UIKit

class BurgersTableViewCell: UITableViewCell {

    @IBOutlet weak var burgerImage: UIImageView!
    @IBOutlet weak var nameBurgerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
