import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let cafeLocationCoordinate = CLLocationCoordinate2D(latitude: 50.406527012766595, longitude: 30.612757568865938)

    override func viewDidLoad() {
        super.viewDidLoad()
        configMapView()
    }
    
    private func configMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = true
        let cafeAnnotation = MKPointAnnotation()
        cafeAnnotation.coordinate = cafeLocationCoordinate
        cafeAnnotation.title = "Cat Cafe"
        mapView.addAnnotation(cafeAnnotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: cafeLocationCoordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        let identifier = "CafeAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
}
