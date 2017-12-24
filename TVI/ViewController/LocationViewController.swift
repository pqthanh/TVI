//
//  FirstViewController.swift
//  TVI
//
//  Created by fwThanh on 12/23/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit
import GoogleMaps
import SlideMenuControllerSwift

class LocationViewController: UIViewController, CLLocationManagerDelegate, UIPopoverPresentationControllerDelegate {
    
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
        
        self.mapView?.isMyLocationEnabled = true
        self.locationManager.startUpdatingLocation()
    }

    @IBAction func leftMenuAction(_ sender: AnyObject) {
        let popoverContent = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewControllerId") as! FilterViewController
        popoverContent.modalPresentationStyle = UIModalPresentationStyle.popover
        popoverContent.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.right
        popoverContent.selectedBlock =  { (type) -> Void in
            popoverContent.dismiss(animated: true, completion: nil)
        }
        let popover = popoverContent.popoverPresentationController
        popoverContent.preferredContentSize = CGSize(width: 260, height: 320)
        popover?.delegate = self
        popover?.sourceView = view
        popover?.sourceRect = CGRect(x: 0, y: -12, width: 0, height: 0)
        self.present(popoverContent, animated: true, completion: nil)
    }
    
    @IBAction func pinAction() {
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        self.mapView?.animate(to: camera)
        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
