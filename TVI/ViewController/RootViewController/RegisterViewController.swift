//
//  RegisterViewController.swift
//  TVI
//
//  Created by fwThanh on 1/1/18.
//  Copyright © 2018 PQT. All rights reserved.
//

import UIKit
import SVProgressHUD

class RegisterViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfFullname: UITextField!
    @IBOutlet weak var tfNickname: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfBirthday: UITextField!
    @IBOutlet weak var tfPromo: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        SVProgressHUD.setDefaultMaskType(.clear)
        
        self.btnRegister.layer.cornerRadius = 5.0
        
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
    
    @IBAction func backAction() {
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerAction() {
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
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
