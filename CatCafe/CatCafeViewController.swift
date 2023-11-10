import UIKit
import CoreLocation
import MapKit

class CatCafeViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var findUsButton: UIButton!
    let locationManager = CLLocationManager()
    
    @IBAction func findUsButtonPress(_ sender: UIButton) {
        requestLocationPermission()
        getCurrentLocation()
    }
    
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
    
    func requestLocationPermission() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    func getCurrentLocation() {
        locationManager.startUpdatingLocation()
    }
}

extension CatCafeViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        manager.stopUpdatingLocation()
        let cafeLocation = CLLocation(latitude: 50.406527012766595, longitude: 30.612757568865938)
    }
}
