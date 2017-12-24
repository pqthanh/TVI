//
//  SecondViewController.swift
//  TVI
//
//  Created by fwThanh on 12/23/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit
import SwiftQRCode

class SecondViewController: UIViewController {

    let scanner = QRCode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scanner.prepareScan(view) { (stringValue) -> () in
            if stringValue != "" {
                print(stringValue)
                self.scanner.stopScan()
                self.scanner.removeAllLayers()
            }
        }
        scanner.scanFrame = view.bounds
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

