import UIKit
import CoreLocation

class CatCafeViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var findUsButton: UIButton!
    
    let locationManager = CLLocationManager()
    let cafeLocationCoordinate = CLLocationCoordinate2D(latitude: 50.406527012766595, longitude: 30.612757568865938)
    
    @IBAction func findUsButtonPress(_ sender: UIButton) {
        requestLocationPermission()
        navigateToMapStoryboard()
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
    
    private func addButtonApparance() {
        menuButton.layer.cornerRadius = 26
        menuButton.layer.borderWidth = 1
        menuButton.layer.masksToBounds = true
        menuButton.layer.borderColor = UIColor.gray.cgColor
    }
    
    func requestLocationPermission() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.delegate = self
                self.locationManager.requestWhenInUseAuthorization()
            } else {
                print("Геолокація вимкнена на пристрої")
            }
        }
    }
    
    func navigateToMapStoryboard() {
        let otherController = UIStoryboard(name: "MapViewController", bundle: nil).instantiateViewController(withIdentifier: "MapViewController")
        navigationController?.pushViewController(otherController, animated: true)
    }
}

extension CatCafeViewController: CLLocationManagerDelegate {
    
    func getCurrentLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        manager.stopUpdatingLocation()
        let userLocation = location.coordinate
        let cafeLocation = cafeLocationCoordinate
        print("Користувача знаходиться на координатах: \(userLocation)")
        print("Кафе розташоване на координатах: \(cafeLocation)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Помилка геолокації: \(error.localizedDescription)")
    }
}


