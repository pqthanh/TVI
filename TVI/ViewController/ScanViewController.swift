//
//  SecondViewController.swift
//  TVI
//
//  Created by fwThanh on 12/23/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit
import SwiftQRCode

class ScanViewController: UIViewController {

    @IBOutlet weak var viewPayment: UIView!
    let scanner = QRCode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.viewPayment.isHidden = true
        scanner.prepareScan(view) { (stringValue) -> () in
            if stringValue != "" {
                print(stringValue)
                self.scanner.stopScan()
                self.scanner.removeAllLayers()
                self.viewPayment.isHidden = false
            }
        }
        scanner.scanFrame = view.bounds
    }

    @IBAction func paymentAction() {
        self.view.endEditing(true)
        self.viewPayment.isHidden = true
        scanner.startScan()
        self.scanner.removeAllLayers()
        scanner.prepareScan(view) { (stringValue) -> () in
            if stringValue != "" {
                print(stringValue)
                self.scanner.stopScan()
                self.scanner.removeAllLayers()
                self.viewPayment.isHidden = false
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // start scan
        scanner.startScan()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

