//
//  FilterViewController.swift
//  TVI
//
//  Created by fwThanh on 12/24/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedBlock: ((Location) -> Void)? = nil
    var listItems = [Location]()
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.listItems.append(Location(code: "1", name: "Khách sạn"))
        self.listItems.append(Location(code: "2", name: "Nhà hàng"))
        self.listItems.append(Location(code: "3", name: "Mua sắm"))
        self.listItems.append(Location(code: "4", name: "Du lịch"))
        self.listItems.append(Location(code: "5", name: "Massage"))
        
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as UITableViewCell
        cell.textLabel?.numberOfLines = 0
        let value: Location = listItems[indexPath.row]
        cell.textLabel?.text = value.name ?? ""
        cell.imageView?.image = UIImage(named: value.code ?? "1")
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (self.selectedBlock != nil) {
            let country = self.listItems[indexPath.row] as Location
            self.selectedBlock!(country)
        }
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
