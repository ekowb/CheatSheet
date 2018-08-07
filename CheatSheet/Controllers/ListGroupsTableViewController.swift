//
//  ListGroupsTableViewController.swift
//  CheatSheet
//
//  Created by Ekow Buadu on 7/24/18.
//  Copyright © 2018 Ekow Buadu. All rights reserved.
//

import UIKit

class ListGroupsTableViewController: UITableViewController {
    
    var earlyVC = TaskListTableViewController()
    
    
    var subject: [Groups] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    let list = [general.title, academics.title, extracurriculars.title, workAndFinance.title, lifeAndHealth.title]
    let colors = [
        // purple
        UIColor(red: 0x94 / 0xFF, green: 0x73 / 0xFF, blue: 0xBA / 0xFF, alpha: 0xFF / 0xFF),
        // red
        UIColor(red: 0xCE / 0xFF, green: 0x56 / 0xFF, blue: 0x3C / 0xFF, alpha: 0xFF / 0xFF),
        // gray
        UIColor(red: 0x48 / 0xFF, green: 0x46 / 0xFF, blue: 0x4B / 0xFF, alpha: 0xFF / 0xFF),
        // green
        UIColor(red: 0x86 / 0xFF, green: 0xB6 / 0xFF, blue: 0x52 / 0xFF, alpha: 0xFF / 0xFF),
        // blue
        UIColor(red: 0x4C / 0xFF, green: 0xA7 / 0xFF, blue: 0xB4 / 0xE9, alpha: 0xFF / 0xFF)]
    // blue
    // UIColor(red: 0x48 / 0xFF, green: 0x8E / 0xFF, blue: 0xEB / 0xFF, alpha: 0xFF / 0xFF),
    // yellow
   // UIColor(red: 0xE7 / 0xFF, green: 0xC0 / 0xFF, blue: 0x33 / 0xFF, alpha: 0xFF / 0xFF),
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listGroupsTableViewCell", for: indexPath) as! ListGroupsTableViewCell
        
        cell.groupTitleLabel1?.text = list[indexPath.row]
        cell.groupTitleView.backgroundColor = colors[indexPath.row]
        return cell
    }
}
