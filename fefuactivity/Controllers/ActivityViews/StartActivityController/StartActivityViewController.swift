import UIKit
import CoreLocation
import MapKit

private let image = UIImage(named: "Background")

private let identifier = "ActivityTypeCollectionViewCell"

class StartActivityViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var startActivity: UIView!
    @IBOutlet weak var toStartLabel: UILabel!
    @IBOutlet weak var startActivityButton: ActivityFEFUButton!
    @IBOutlet weak var listOfActivitiesType: UICollectionView!
    
    private let data: [ActivityTypeCellViewModel] =
    [
        ActivityTypeCellViewModel(activityType: "Велосипед", activityTypeImage: image ?? UIImage()),
        ActivityTypeCellViewModel(activityType: "Бег", activityTypeImage: image ?? UIImage()),
        ActivityTypeCellViewModel(activityType: "Ходьба", activityTypeImage: image ?? UIImage())
    ]
    
    private var previousRouteSegment: MKPolyline?
    
    private let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        return manager
    }()
    
    fileprivate var userLocation: CLLocation? {
        didSet {
            guard let userLocation = userLocation else {
                return
            }
            let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
            
            mapView.setRegion(region, animated: true)
            
            userLocationsHistory.append(userLocation)
        }
    }
    
    fileprivate var userLocationsHistory: [CLLocation] = [] {
        didSet {
            let coordinates = userLocationsHistory.map { $0.coordinate }
            
            if let previousRoute = previousRouteSegment {
                mapView.removeOverlay(previousRoute as MKOverlay)
                previousRouteSegment = nil
            }
            
            let route = MKPolyline(coordinates: coordinates, count: coordinates.count)
            route.title = "Ваш маршрут"
            
            previousRouteSegment = route
            
            mapView.addOverlay(route)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        self.title = "Новая активность"
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        listOfActivitiesType.dataSource = self
        listOfActivitiesType.delegate = self
        
        let nib = UINib(nibName: identifier, bundle: nil)
        listOfActivitiesType.register(nib, forCellWithReuseIdentifier: identifier)
        
        commonInit()
    }
    
    private func commonInit() {
        startActivity.layer.cornerRadius = 25
        
        toStartLabel.text = "Погнали? :)"
        
        startActivityButton.setTitle("Старт", for: .normal)
    }
    
    
    @IBAction func didStartTracking(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
}

// MARK: - CLLocationManagerDelegate

extension StartActivityViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first else {
            return
        }
    
        userLocation = currentLocation
    }
}

//MARK: - MKMapViewDelegate

extension StartActivityViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let render = MKPolylineRenderer(polyline: polyline)
            
            render.fillColor = .blue
            render.strokeColor = .blue
            render.lineWidth = 5
            
            return render
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
}

//MARK: - UICollectionViewDataSource

extension StartActivityViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let activityTypeData = data[indexPath.row]
        
        let dequeuedCell = listOfActivitiesType.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        guard let upcastedCell = dequeuedCell as? ActivityTypeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        upcastedCell.bind(activityTypeData)
        
        return upcastedCell
    }
}

// MARK: - UICollectionViewDelegate
extension StartActivityViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ActivityTypeCollectionViewCell {
            cell.cardView.layer.borderWidth = 2
            cell.cardView.layer.borderColor = UIColor(named: "ButtonBackgroundColor")?.cgColor
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ActivityTypeCollectionViewCell {
            cell.cardView.layer.borderWidth = 0
        }
    }
}
