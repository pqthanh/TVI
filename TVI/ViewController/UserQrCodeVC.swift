//
//  UserQrCodeVC.swift
//  TVI
//
//  Created by fwThanh on 12/31/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit
import SwiftQRCode

class UserQrCodeVC: UIViewController {

    @IBOutlet weak var imgCode: UIImageView!
    @IBOutlet weak var btnPayment: UIButton!
    @IBOutlet weak var viewBg: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.btnPayment.layer.cornerRadius = 5.0
        self.imgCode.layer.cornerRadius = 5.0
        self.viewBg.layer.cornerRadius = 120.0
        self.imgCode.image = QRCode.generateImage("122#fwthanh#fwhanh@gmail.com", avatarImage: nil)
        self.imgCode.layer.borderWidth = 3.0
        self.imgCode.layer.borderColor = UIColor(hexString: "#F35D54").cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
