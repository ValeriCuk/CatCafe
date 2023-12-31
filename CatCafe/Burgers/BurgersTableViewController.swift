import UIKit

class BurgersTableViewController: UITableViewController {
    
    @IBOutlet var burgersTableView: UITableView!
    
    var menuSinglton = MenuSingleton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        getDataForBurgersMenu()
    }
    
    private func configTableView() {
        burgersTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        burgersTableView.dataSource = self
        burgersTableView.delegate = self
    }
    
    private func getDataForBurgersMenu() {
        APIManager.shared.getData{ [weak self] menu in
            DispatchQueue.main.async {
                guard let self else {return}
                self.menuSinglton.menuData = menu
                self.burgersTableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuSinglton.menuData.burgers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell else{
            return UITableViewCell()
        }
        let menuData = menuSinglton.menuData.burgers[indexPath.row]
        if let imagePath = menuData.image {
           cell.itemImage.loadImage(with: imagePath)
        }
        cell.nameLabel.text = menuData.name
        cell.priceLabel.text = String(menuData.price)
        cell.descriptionLabel.text = menuData.description
        cell.backgroundColor = UIColor(red: 244/255, green: 207/255, blue: 255/255, alpha: 1)
        return cell
    }
}
