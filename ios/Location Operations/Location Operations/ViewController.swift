//
//  ViewController.swift
//  Location Operations
//
//  Created by cemal tüysüz on 8.01.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    var lm = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.delegate = self
        
        lm.requestWhenInUseAuthorization()
        lm.startUpdatingLocation()
        
    }


}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations[locations.count-1]
        
        latitudeLabel.text = "Lat : \(lastLocation.coordinate.latitude)"
        longitudeLabel.text = "Long : \(lastLocation.coordinate.longitude)"
    }
}

