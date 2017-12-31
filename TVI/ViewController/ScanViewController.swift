//
//  SecondViewController.swift
//  TVI
//
//  Created by fwThanh on 12/23/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit
import SwiftQRCode

class ScanViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var viewPayment: UIView!
    @IBOutlet weak var tfMoney: UITextField!
    @IBOutlet weak var tfCoin: UITextField!
    @IBOutlet weak var tfPromo: UITextField!
    @IBOutlet weak var tfTotal: UITextField!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var btnPayment: UIButton!
    
    let scanner = QRCode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.btnPayment.layer.cornerRadius = 5.0
        self.hideKeyboardWhenTappedAround()
        
        self.viewPayment.isHidden = true
        scanner.prepareScan(view) { (stringValue) -> () in
            if stringValue != "" && stringValue.components(separatedBy: "#").count == 3 {
                print(stringValue)
                
                let name = stringValue.components(separatedBy: "#")[1]
                self.lbTitle.text = name
                let address = stringValue.components(separatedBy: "#")[2]
                self.lbAddress.text = address
                
                self.scanner.stopScan()
                self.scanner.removeAllLayers()
                self.viewPayment.isHidden = false
            }
            else {
                let alert = UIAlertController(title: "Thông tin không hợp lệ, vui lòng thử lại", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Tiếp tục", style: .default, handler: { action in
                    self.scanner.startScan()
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        scanner.scanFrame = view.bounds
    }

    @IBAction func backAction() {
        self.view.endEditing(true)
        scanner.stopScan()
        self.scanner.removeAllLayers()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func paymentAction() {
        self.view.endEditing(true)
        self.viewPayment.isHidden = true
        scanner.stopScan()
        self.scanner.removeAllLayers()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func checkPromo(promoCode: String) {
        let value = Double(self.tfCoin.text ?? "0")
        let totalCoin = Double(round(1000*value!*75/100)/1000)
        self.tfTotal.text = "\(totalCoin)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // start scan
        scanner.startScan()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.tfMoney && textField.text != "" {
            let value: Double = Double(textField.text!)!
            self.tfMoney.text = value.formatAsCurrency(currencyCode: "VND")
            
            let coin = Double(round(1000*value/23000)/1000)
            self.tfCoin.text = "\(coin)"
            self.tfTotal.text = "\(coin)"
        }
        else if textField == self.tfPromo && textField.text != "" {
            self.checkPromo(promoCode: textField.text!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

