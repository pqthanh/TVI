//
//  ProfileViewController.swift
//  TVI
//
//  Created by fwThanh on 12/23/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var avata: UIImageView!
    @IBOutlet weak var lbMoney: UILabel!
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var btnUpdate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        self.view1.layer.cornerRadius = 5.0
        self.view2.layer.cornerRadius = 5.0
        self.view3.layer.cornerRadius = 5.0
        self.view4.layer.cornerRadius = 5.0
        self.cover.layer.cornerRadius = 5.0
        self.btnUpdate.layer.cornerRadius = 5.0
        self.avata.layer.cornerRadius = 50.0
        self.avata.layer.borderWidth = 2.0
        self.avata.layer.borderColor = UIColor(hexString: "#F35D54").cgColor
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    func keyboardWillShow(notification:NSNotification){
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        let keyboardHeight = keyboardSize.height - 48
        let keyboardFrame:CGRect = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: keyboardHeight)
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    @IBAction func updateAction() {
        self.view.endEditing(true)
    }
    
    @IBAction func pageAction() {
        self.view.endEditing(true)
    }
    
    @IBAction func chatAction() {
        self.view.endEditing(true)
    }
    
    @IBAction func passwordAction() {
        self.view.endEditing(true)
    }
    
    @IBAction func hítoryAction() {
        self.view.endEditing(true)
    }
    
    @IBAction func changeAction(_ sender: UIButton) {
        self.view.endEditing(true)
        self.btnChange.isSelected = !sender.isSelected
        self.lbMoney.text = sender.isSelected ? "12$ - 264.000đ" : "12 TVI"
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
