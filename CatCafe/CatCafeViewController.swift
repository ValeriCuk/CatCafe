import UIKit

class CatCafeViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
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
        menuButton.layer.cornerRadius = 26
        menuButton.layer.borderWidth = 1
        menuButton.layer.masksToBounds = true
        menuButton.layer.borderColor = UIColor.gray.cgColor
    }
}

