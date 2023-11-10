import UIKit

class DessertsTableViewController: UITableViewController{
    
    @IBOutlet var dessertsTableView: UITableView!
    private var menuData = Menu(burgers: [], drinks: [], desserts: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        getDataForBurgersMenu()
    }
    
    private func configTableView(){
        dessertsTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        dessertsTableView.dataSource = self
        dessertsTableView.delegate = self
    }
    
    private func getDataForBurgersMenu(){
        APIManager.shared.getData{ [weak self] menu in
            DispatchQueue.main.async {
                guard let self else {return}
                self.menuData = menu
                self.dessertsTableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuData.desserts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell else{
            return UITableViewCell()
        }
        let menuData = menuData.desserts[indexPath.row]
  
        if let imagePath = menuData.image,
               let imageURL = URL(string: "\(imagePath)") {
                URLSession.shared.dataTask(with: imageURL) { data, _, error in
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            let image = UIImage(data: data)
                            cell.itemImage.image = image
                        }
                    }
                }.resume()
            }
        cell.nameLabel.text = menuData.name
        
        cell.backgroundColor = UIColor(red: 244/255, green: 207/255, blue: 255/255, alpha: 1)
        return cell
    }
}
