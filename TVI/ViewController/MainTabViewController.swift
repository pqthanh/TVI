//
//  MainTabViewController.swift
//  TeamCaring
//
//  Created by Phan Quoc Thanh on 12/15/17.
//  Copyright © 2017 PqThanh. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainViewController = storyboard.instantiateViewController(withIdentifier: "LocationNavigationVCId")
//        let leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftLocationViewId")
//        let initialViewController = SlideMenuController(mainViewController: mainViewController, leftMenuViewController: leftViewController)
//        initialViewController.removeLeftGestures()
//        self.viewControllers![0] = initialViewController
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

extension Double {
    func formatAsCurrency(currencyCode: String) -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        currencyFormatter.currencyCode = currencyCode
        currencyFormatter.locale = (currencyCode == "VND" ? Locale(identifier: "vi") : Locale(identifier: "en"))
        currencyFormatter.maximumFractionDigits = floor(self) == self ? 0 : 2
        let locale = NSLocale(localeIdentifier: currencyCode)
        let currencySymbol = locale.displayName(forKey: .currencySymbol, value: currencyCode) ?? currencyCode
        return currencyFormatter.string(from: NSNumber(value: self))?.replacingOccurrences(of: currencySymbol, with: "").replacingOccurrences(of: " ", with: "")
    }
}
