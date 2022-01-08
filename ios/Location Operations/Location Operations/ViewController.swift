//
//  ViewController.swift
//  Location Operations
//
//  Created by cemal tüysüz on 8.01.2022.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    var lm = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.delegate = self
        
        lm.requestWhenInUseAuthorization()
        lm.startUpdatingLocation()
        
        // 41.0370176,28.9763369,15z
        let location = CLLocationCoordinate2D(latitude: 41.0370176, longitude: 28.9763369)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = location
        pin.title = "My Location Title"
        pin.subtitle = "My Location SubTitle"
        
        mapView.addAnnotation(pin)
    }
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations[locations.count-1]
        
        latitudeLabel.text = "Lat : \(lastLocation.coordinate.latitude)"
        longitudeLabel.text = "Long : \(lastLocation.coordinate.longitude)"
    }
}

