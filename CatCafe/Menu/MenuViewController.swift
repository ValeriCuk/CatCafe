import UIKit

enum TypesOfDishes{
    case burgers
    case drinks
    case dessrts
}

class MenuViewController: UIViewController{
    
    @IBOutlet weak var burgersButton: UIButton!
    @IBOutlet weak var drinksButton: UIButton!
    @IBOutlet weak var dessertsButton: UIButton!
    
    @IBAction func burgersButtonPressed(_ sender: UIButton) {
        goToOtherStoryboard(type: .burgers)
    }
    @IBAction func drinksButtonPressed(_ sender: UIButton) {
        goToOtherStoryboard(type: .drinks)
    }
    @IBAction func dessertsButtonPressed(_ sender: UIButton) {
        goToOtherStoryboard(type: .dessrts)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBordersButtons()
    }
    
    private func addBordersButtons(){
        addApparanceButton(button: burgersButton)
        addApparanceButton(button: drinksButton)
        addApparanceButton(button: dessertsButton)
    }
    
    private func addApparanceButton(button: UIButton){
        button.layer.cornerRadius = 26
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func storyboardID(_ type: TypesOfDishes) -> String {
        switch type {
        case .burgers:
            "BurgersTableViewController"
        case .drinks:
            "DrinksTableViewController"
        case .dessrts:
            "DessertTableViewController"
        }
    }
    
    private func goToOtherStoryboard(type: TypesOfDishes){
        let name = storyboardID(type)
        let otherStoryboard = UIStoryboard(name: name, bundle: nil)
        if let otherViewController = otherStoryboard.instantiateViewController(withIdentifier: name) as? UITableViewController {
            navigationController?.pushViewController(otherViewController, animated: true)
        }
    }
}
