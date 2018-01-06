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
import Alamofire

class LocationViewController: UIViewController, CLLocationManagerDelegate, UIPopoverPresentationControllerDelegate, GMSMapViewDelegate {
    
    let locationManager = CLLocationManager()
    var mapView: GMSMapView?
    var currentLocation: CLLocationCoordinate2D?
    var currentline: GMSPolyline? = nil
    var selectedTeamIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        let camera = GMSCameraPosition.camera(withLatitude: 10.762622, longitude: 106.660172, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView?.setMinZoom(14, maxZoom: 18)
        view = mapView
        mapView?.delegate = self
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 10.789668, longitude: 106.643115)
        marker.infoWindowAnchor = CGPoint(x: 0.5, y: 0.0)
        marker.icon = UIImage(named: "4")
        marker.userData = 1
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 10.786354, longitude: 106.666379)
        marker2.infoWindowAnchor = CGPoint(x: 0.5, y: 0.0)
        marker2.icon = UIImage(named: "3")
        marker2.userData = 2
        
        marker.map = mapView
        marker2.map = mapView
        
        self.mapView?.isMyLocationEnabled = true
        self.locationManager.startUpdatingLocation()
    }

    func drawPath(origin: String, destination: String)
    {
        if self.currentline != nil {
            self.currentline?.map = nil
        }
        FService.sharedInstance.apiGoogleMap(origin: origin, destination: destination) { (line) in
            let path = GMSPath.init(fromEncodedPath: line!)
            self.currentline = GMSPolyline.init(path: path)
            self.currentline?.strokeWidth = 3
            self.currentline?.strokeColor = UIColor(hexString: "#F35D54")
            self.currentline?.map = self.mapView
        }
    }
    
    @IBAction func leftMenuAction(_ sender: AnyObject) {
        let popoverContent = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewControllerId") as! FilterViewController
        popoverContent.modalPresentationStyle = UIModalPresentationStyle.popover
        popoverContent.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        if self.selectedTeamIndex != nil {
            popoverContent.indexSelected = self.selectedTeamIndex! as IndexPath
        }
        popoverContent.selectedBlock =  { (type, indexPath) -> Void in
            self.selectedTeamIndex = indexPath as IndexPath
            popoverContent.dismiss(animated: true, completion: nil)
        }
        let popover = popoverContent.popoverPresentationController
        popoverContent.preferredContentSize = CGSize(width: 200, height: 320)
        popover?.delegate = self
        popover?.sourceView = view
        popover?.sourceRect = CGRect(x: 0, y: -12, width: 0, height: 0)
        self.present(popoverContent, animated: true, completion: nil)
    }
    
    @IBAction func pinAction() {
        self.locationManager.startUpdatingLocation()
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        if let customInfoWindow = Bundle.main.loadNibNamed("CustomInfoWindow", owner: self, options: nil)?[0] as? CustomInfoWindow {
            return customInfoWindow
        }
        return nil
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let firstAction: UIAlertAction = UIAlertAction(title: "Đường đi", style: .default) { action -> Void in
            let index: Int = marker.userData as! Int
            if index == 1 {
                let origin = "\(self.currentLocation?.latitude ?? 0.0),\(self.currentLocation?.longitude ?? 0.0)"
                let destination = "\(10.789668),\(106.643115)"
                self.drawPath(origin: origin, destination: destination)
            }
            if index == 2 {
                let origin = "\(self.currentLocation?.latitude ?? 0.0),\(self.currentLocation?.longitude ?? 0.0)"
                let destination = "\(10.786354),\(106.666379)"
                self.drawPath(origin: origin, destination: destination)
            }
            mapView.selectedMarker = nil
        }
        let secondAction: UIAlertAction = UIAlertAction(title: "Xem chi tiết", style: .default) { action -> Void in
            print("Second Action pressed")
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "Bỏ qua", style: .cancel) { action -> Void in }
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(secondAction)
        actionSheetController.addAction(cancelAction)
        present(actionSheetController, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        self.mapView?.animate(to: camera)
        self.currentLocation = location?.coordinate
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
