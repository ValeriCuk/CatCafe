//
//  BurgersViewController.swift
//  CatCafe
//
//  Created by Lera Cuk on 08.11.2023.
//

import UIKit

class BurgersTableViewController: UITableViewController{
    
    @IBOutlet var burgersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    private func configTableView(){
        burgersTableView.register(UINib(nibName: "BurgersTableViewCell", bundle: nil), forCellReuseIdentifier: "BurgersTableViewCell")
        burgersTableView.dataSource = self
        burgersTableView.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BurgersTableViewCell", for: indexPath) as? BurgersTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
}
