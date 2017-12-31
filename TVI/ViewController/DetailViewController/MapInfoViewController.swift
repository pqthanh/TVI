//
//  MapInfoViewController.swift
//  TVI
//
//  Created by fwThanh on 12/30/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit

class MapInfoViewController: UIViewController {

    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var btnDrawPath: UIButton!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.layer.borderWidth = 2.0
        self.view.layer.borderColor = UIColor(hexString: "#008001").cgColor
        self.view.layer.cornerRadius = 10.0
    }

    @IBAction func drawPathAction() {
        print("-----------")
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
