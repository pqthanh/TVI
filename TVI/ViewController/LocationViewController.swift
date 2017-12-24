//
//  FirstViewController.swift
//  TVI
//
//  Created by fwThanh on 12/23/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit
import GoogleMaps

class LocationViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var viewMap: UIView!
    
    let locationManager = CLLocationManager()
    var mapView: GMSMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        let camera = GMSCameraPosition.camera(withLatitude: 10.762622, longitude: 106.660172, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView?.setMinZoom(14, maxZoom: 16)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 10.762622, longitude: 106.660172)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
