import UIKit

class BurgersTableViewController: UITableViewController{
    
    @IBOutlet var burgersTableView: UITableView!
    private var menuData = Menu(burgers: [], drinks: [], desserts: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        getDataForBurgersMenu()
    }
    
    private func configTableView(){
        burgersTableView.register(UINib(nibName: "BurgersTableViewCell", bundle: nil), forCellReuseIdentifier: "BurgersTableViewCell")
        burgersTableView.dataSource = self
        burgersTableView.delegate = self
    }
    
    private func getDataForBurgersMenu(){
        APIManager.shared.getData{ [weak self] menu in
            DispatchQueue.main.async {
                guard let self else {return}
                self.menuData = menu
                self.burgersTableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuData.burgers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BurgersTableViewCell", for: indexPath) as? BurgersTableViewCell else{
            return UITableViewCell()
        }
        let menuData = menuData.burgers[indexPath.row]
  
        if let imagePath = menuData.image,
               let imageURL = URL(string: "\(imagePath)") {
                URLSession.shared.dataTask(with: imageURL) { data, _, error in
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            let image = UIImage(data: data)
                            cell.burgerImage.image = image
                        }
                    }
                }.resume()
            }
        cell.nameBurgerLabel.text = menuData.name
        
        cell.backgroundColor = UIColor(red: 244/255, green: 207/255, blue: 255/255, alpha: 1)
        return cell
    }
}
