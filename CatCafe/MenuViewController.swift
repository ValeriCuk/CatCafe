import UIKit

class MenuViewController: UIViewController{
    
    @IBOutlet weak var burgersButton: UIButton!
    @IBOutlet weak var drinksButton: UIButton!
    @IBOutlet weak var dessertsButton: UIButton!
    
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
}
